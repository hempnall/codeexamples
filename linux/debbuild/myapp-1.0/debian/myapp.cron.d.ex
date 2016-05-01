#
# Regular cron jobs for the myapp package
#
0 4	* * *	root	[ -x /usr/bin/myapp_maintenance ] && /usr/bin/myapp_maintenance
