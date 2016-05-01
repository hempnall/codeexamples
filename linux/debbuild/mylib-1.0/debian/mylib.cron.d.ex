#
# Regular cron jobs for the mylib package
#
0 4	* * *	root	[ -x /usr/bin/mylib_maintenance ] && /usr/bin/mylib_maintenance
