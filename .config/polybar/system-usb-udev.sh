#!/bin/env sh
#
# A small script that shows your mounted and not mounted removable devices. This is an extended version of system-usb-mount.
#
# Dependencies:
#		* jq
#		* udisk2 
#
# Click left to mount all removable devices. Click right to unmount the devices. The removable devices are then turned off with udisksctl power-off.
#
# The mount option has a feature: You can also start a file manager and open the device when you mount it. Look at the example in the code: 
# terminal -e "bash -lc 'filemanager $mountpoint'" &
#
# This script is able to display device changes in real time. For this udev is being used.
#
# Copy below to appropriate paths
# IMPORTANT! Make sure that the paths have been modified properly!
#
# /etc/udev/rules.d/95-usb.rules:
#KERNEL=="sd*", ACTION=="add", ATTR{removable}=="1", \
#RUN+="/home/user/.config/polybar/system-usb-mount.sh --update"
#KERNEL=="sd*", ACTION=="remove", \
#RUN+="/home/user/.config/polybar/system-usb-mount.sh --update"
#
# Polybar Module:
#[module/system-usb-udev]
#type = custom/script
#exec = ~/path/to/system-usb.sh
#tail = true
#click-left = ~/path/to/system-usb-udev.sh --mount
#click-right = ~/path/to/system-usb-udev.sh --unmount
#
# sourced from: (https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/system-usb-udev)
# screenshot0: (https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/system-usb-udev/screenshots/1.png)
# screenshot1: (https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/system-usb-udev/screenshots/2.png)

usb_print() {
    devices=$(lsblk -Jplno NAME,TYPE,RM,SIZE,MOUNTPOINT,VENDOR)
    output=""
    counter=0

    for unmounted in $(echo "$devices" | jq -r '.blockdevices[]  | select(.type == "part") | select(.rm == "1") | select(.mountpoint == null) | .name'); do
        unmounted=$(echo "$unmounted" | tr -d "[:digit:]")
        unmounted=$(echo "$devices" | jq -r '.blockdevices[]  | select(.name == "'"$unmounted"'") | .vendor')
        unmounted=$(echo "$unmounted" | tr -d ' ')

        if [ $counter -eq 0 ]; then
            space=""
        else
            space="   "
        fi
        counter=$((counter + 1))

        output="$output$space#1 $unmounted"
    done

    for mounted in $(echo "$devices" | jq -r '.blockdevices[] | select(.type == "part") | select(.rm == "1") | select(.mountpoint != null) | .size'); do
        if [ $counter -eq 0 ]; then
            space=""
        else
            space="   "
        fi
        counter=$((counter + 1))

        output="$output$space#2 $mounted"
    done

    echo "$output"
}

usb_update() {
    pid=$(pgrep -xf "/bin/sh /home/user/.config/polybar/system-usb-udev.sh")

    if [ "$pid" != "" ]; then
        kill -10 "$pid"
    fi
}

case "$1" in
    --update)
        usb_update
        ;;
    --mount)
        devices=$(lsblk -Jplno NAME,TYPE,RM,MOUNTPOINT)

        for mount in $(echo "$devices" | jq -r '.blockdevices[]  | select(.type == "part") | select(.rm == "1") | select(.mountpoint == null) | .name'); do
            # udisksctl mount --no-user-interaction -b "$mount"

            # mountpoint=$(udisksctl mount --no-user-interaction -b $mount)
            # mountpoint=$(echo $mountpoint | cut -d " " -f 4 | tr -d ".")
            # terminal -e "bash -lc 'filemanager $mountpoint'"

            mountpoint=$(udisksctl mount --no-user-interaction -b "$mount")
            mountpoint=$(echo "$mountpoint" | cut -d " " -f 4 | tr -d ".")
            termite -e "bash -lc 'mc $mountpoint'" &
        done

        usb_update
        ;;
    --unmount)
        devices=$(lsblk -Jplno NAME,TYPE,RM,MOUNTPOINT)

        for unmount in $(echo "$devices" | jq -r '.blockdevices[]  | select(.type == "part") | select(.rm == "1") | select(.mountpoint != null) | .name'); do
            udisksctl unmount --no-user-interaction -b "$unmount"
            udisksctl power-off --no-user-interaction -b "$unmount"
        done

        usb_update
        ;;
    *)
        trap exit INT
        trap "echo" USR1

        while true; do
            usb_print

            sleep 60 &
            wait
        done
        ;;
esac
