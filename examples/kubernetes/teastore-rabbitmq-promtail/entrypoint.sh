#!/bin/bash
echo "USING ENTRYPOINT SCRIPT TO CREATE SYMLINK!"
while true; do
    log_file=$(find /apache-tomcat-8.5.24/webapps/logs/kieker-* -type f -name 'kieker-*' -print -quit 2>/dev/null)
    if [ -n "$log_file" ]; then
	echo "SYMLINK CREATED!"    
        ln -s "$log_file" sym-kieker-output.dat
        break
    fi
    sleep 1
done

