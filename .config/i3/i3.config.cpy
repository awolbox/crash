# awolbox

##~~~~~~ GENERAL ~~~~~~~~~##

set $mod Mod4
set $term urxvtc
font pango:Terminus, FontAwesome 10

# term
bindsym $mod+Return exec --no-startup-id $term
bindsym $mod+Shift+Return exec --no-startup-id $term -e tmux
# rofi
bindsym $mod+x exec rofi -show drun -modi drun -show-icons d
# reload config
bindsym $mod+Shift+c reload	
# redraw i3
bindsym $mod+Shift+r restart
# screen/web recording
bindsym $mod+q exec --no-startup-id $HOME/.bin/screencast.sh
bindsym $mod+Shift+q exec --no-startup-id $HOME/.bin/screencast_mic.sh
bindsym $mod+w exec --no-startup-id $HOME/.bin/webcast.sh
bindsym $mod+Shift+w exec --no-startup-id $HOME/.bin/webcast_mic.sh
# stop
bindsym $mod+p exec pkill ffmpeg 
# multihead
bindsym $mod+Left exec --no-startup-id $HOME/.bin/dual_left.sh
bindsym $mod+Up exec --no-startup-id $HOME/.bin/dual_top.sh
bindsym $mod+Right exec --no-startup-id $HOME/.bin/dual_right.sh
bindsym $mod+Down exec --no-startup-id $HOME/.bin/dual_off.sh
# dvds
bindsym $mod+grave exec --no-startup-id mpv dvd://; Workspace $WS6
# pass
bindsym $mod+z exec --no-startup-id passmenu

##~~~~~~ WINDOWS ~~~~~~~~~##

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
# split horizontal
bindsym $mod+bracketleft split h
# split vertical
bindsym $mod+bracketright split v 
# fullscreen
bindsym $mod+f fullscreen toggle
# kill focused window
bindsym $mod+c kill
# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod
# resize window
bindsym $mod+Shift+o resize shrink width 10 px or 10 ppt
bindsym $mod+Shift+u resize grow height 10 px or 10 ppt
bindsym $mod+Shift+i resize shrink height 10 px or 10 ppt
bindsym $mod+Shift+y resize grow width 10 px or 10 ppt
# back to normal
bindsym $mod+Shift+Backspace mode "default"
# colors
# [class]                  [border]   [backgr.]   [text]    [indicator]  [child_border]
client.focused             #000000    #000000    #ffffff     #000000        #000000
client.focused_inactive    #000000    #000000    #ffffff     #000000        #000000
client.unfocused           #000000    #000000    #888888     #000000        #000000
client.urgent              #000000    #000000    #ffffff     #000000        #000000
client.placeholder         #000000    #000000    #ffffff     #000000        #000000
client.background          #000000
# borders
for_window [class="^.*"] border pixel 2
# gaps
gaps inner 22
gaps outer 22
# gaps - on/off
bindsym $mod+Shift+f gaps inner current set 22; gaps outer current set 22
bindsym $mod+Shift+d gaps inner current set 0; gaps outer current set 0
# gaps - increase/decrease
bindsym $mod+Shift+g gaps inner current plus 5
bindsym $mod+g gaps inner current minus 5
# dropdown scratchpads
# tmux
for_window [instance="dropdown"] floating enable
for_window [instance="dropdown"] resize set 900 700
for_window [instance="dropdown"] move position center
for_window [instance="dropdown"] move scratchpad
exec --no-startup-id $term -depth 32 -bg [90]{background.alpha} -name dropdown -e tmux 
bindsym $mod+u [instance="dropdown"] scratchpad show; move position center
# python3
for_window [instance="math"] floating enable
for_window [instance="math"] resize set 800 300
for_window [instance="math"] move position center
for_window [instance="math"] move scratchpad
exec --no-startup-id $term -depth 32 -bg [90]{background.alpha} -fn "xft:mono:pixelsize=24" -name math -e python3 -q
bindsym $mod+m [instance="math"] scratchpad show; move position center

##~~~~~~ WORKSPACES ~~~~~~##

# names
set $WS1 "1"
set $WS2 "2"
set $WS3 "3"
set $WS4 "4"
set $WS5 "5"
set $WS6 "6"
set $WS7 "7"
set $WS8 "8"
set $WS9 "9"
set $WS10 "0"
# binds
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev
bindsym $mod+1 workspace $WS1
bindsym $mod+2 workspace $WS2
bindsym $mod+3 workspace $WS3
bindsym $mod+4 workspace $WS4
bindsym $mod+5 workspace $WS5
bindsym $mod+6 workspace $WS6
bindsym $mod+7 workspace $WS7
bindsym $mod+8 workspace $WS8
bindsym $mod+9 workspace $WS9
bindsym $mod+0 workspace $WS10
# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $WS1
bindsym $mod+Shift+2 move container to workspace $WS2
bindsym $mod+Shift+3 move container to workspace $WS3
bindsym $mod+Shift+4 move container to workspace $WS4
bindsym $mod+Shift+5 move container to workspace $WS5
bindsym $mod+Shift+6 move container to workspace $WS6
bindsym $mod+Shift+7 move container to workspace $WS7
bindsym $mod+Shift+8 move container to workspace $WS8
bindsym $mod+Shift+9 move container to workspace $WS9
bindsym $mod+Shift+0 move container to workspace $WS10
# assignments
assign [class="^URxvt$" instance="htop"] 0
assign [class="qutebrowser"] 2
assign [class="^URxvt$" instance="ranger"] 3
assign [class="retroarch"] 5
assign [class="Steam"] 5
assign [class="Vlc"] 6

##~~~~~~ I3BAR ~~~~~~~~~~~##

# polybar
exec_always --no-startup-id ~/.config/polybar/launch.sh

##~~~~~~ POWER MENU ~~~~~~## 

## screenlocker
set $Locker xlock +description +timeelapse -mode lament -fg orange -user " " -info " " && sleep 1 &
# menu config
set $mode_system  [l]ock - [L]ogout - [s]uspend - [h]ibernate - [r]eboot - [S]hutdown 
mode "$mode_system" {
    bindsym l exec --no-startup-id $Locker, mode "default"
    bindsym Shift+L exec --no-startup-id i3-msg exit, mode "default"
    bindsym s exec --no-startup-id $Locker && systemctl suspend, mode "default"
    bindsym h exec --no-startup-id $Locker && systemctl hibernate, mode "default"
    bindsym r exec --no-startup-id systemctl reboot, mode "default"
    bindsym Shift+s exec --no-startup-id systemctl poweroff -i, mode "default"  
    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+space mode "$mode_system"

##~~~~~~ TOUCHPAD ~~~~~~~~##

exec --no-startup-id synclient VertEdgeScroll=3 TapButton1=1 TapButton2=3 TapButton3=2

##~~~~~~ VOLUME ~~~~~~~~~~##

bindsym XF86AudioRaiseVolume exec --no-startup-id "pulseaudio-ctl up 5"
bindsym XF86AudioLowerVolume exec --no-startup-id "pulseaudio-ctl down 5"
bindsym XF86AudioMute exec --no-startup-id "pulseaudio-ctl mute"
# mic - mute/unmute
bindsym Ctrl+Shift+m exec --no-startup-id "pulseaudio-ctl mute-input"

##~~~~~~ MUSIC ~~~~~~~~~~~##

bindsym XF86AudioNext exec --no-startup-id mpc next
bindsym XF86AudioPrev exec --no-startup-id mpc prev
bindsym XF86AudioPlay exec --no-startup-id mpc toggle

##~~~~~~ EJECT ~~~~~~~~~~~##

bindsym XF86Eject exec --no-startup-id eject /dev/sr0

##~~~~~~ ALIENFX ~~~~~~~~~##

bindsym XF86Launch1 exec --no-startup-id alienfx-gtk

##~~~~~~ STARTUP ~~~~~~~~~##

exec --no-startup-id $HOME/.bin/xss.sh	
exec --no-startup-id /usr/bin/compton -f --xrender-sync --xrender-sync-fence
exec --no-startup-id /usr/bin/blueman-applet
exec --no-startup-id /usr/bin/nvidia-settings --load-config-only 
exec --no-startup-id /usr/bin/wal -R -a "90"
exec --no-startup-id /usr/bin/unclutter -idle 1

