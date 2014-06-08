#!/usr/bin/expect -f
# Expect script to supply root/admin password for remote ssh server 
# and execute command.
# This script needs three argument to(s) connect to remote server:
# password = Password of remote UNIX server, for root user.
# ipaddr = IP Addreess of remote UNIX server, no hostname
# scriptname = Path to remote script which will execute on remote server
# For example:
#  ./sshlogin.exp password 192.168.1.11 who 
# ------------------------------------------------------------------------
# Copyright (c) 2004 nixCraft project <http://cyberciti.biz/fb/>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# ----------------------------------------------------------------------
# set Variables
set hostfile [lrange $argv 0 0] 
set logdir [lrange $argv 1 1] 
set password [lrange $argv 2 2]   
#set number_of_hosts [lrange $argv 3 3]
set timeout -1   
# now connect to remote UNIX box (ipaddr) with given script to execute
spawn  gpseginstall -f $hostfile -u gpadmin -p gpadmin >> $logdir/gpseginstall.log
match_max 100000
# Look for passwod prompt
expect "*Enter password for*"
# Send password aka $password 
send -- "$password\r"
# send blank line (\r) to make sure we get back to gui
# send -- "\r"
expect eof
