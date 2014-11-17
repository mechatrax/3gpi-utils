#
# Regular cron jobs for the 3gpi-utils package
#
*/5 *	* * *	root	. /etc/default/3gpi-utils; [ $AUTO_ON -eq 0 ] || [ $KEEP_ON -eq 0 ] || [ $(/usr/sbin/3gpictl --status) = "on" ] || /usr/sbin/3gpictl --poweron
