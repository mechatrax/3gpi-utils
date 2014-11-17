#
# Regular cron jobs for the 3gpi-utils package
#
*/5 *	* * *	root	[ -x /usr/sbin/3gpikeep.sh ] && /usr/sbin/3gpikeep.sh
