#!/bin/bash
sleep 30
log_file=$(find /apache-tomcat-8.5.24/webapps/logs/kieker-* -type f -name 'kieker-*' -print -quit 2>/dev/null)
tail -f "$log_file" > /var/log/custom.log
