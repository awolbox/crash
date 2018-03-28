#
# ~/.bash_logout - awolbox@crash
#
if [ -f $HOME/.bash_logins ];
then
	echo "<< @ `date` - `tty`" >> $HOME/.bash_logins
else
	touch $HOME/.bash_logins &&
		chmod 600 $HOME/.bash_logins
	echo "<< @ `date` - `tty`" >> $HOME/.bash_logins
fi
