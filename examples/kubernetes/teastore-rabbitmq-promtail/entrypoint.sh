#!/bin/bash
echo "USING ENTRYPOINT SCRIPT TO CREATE SYMLINK!"
#if [ ! -d "symlogs" ]; then
#	mkdir symlogs
#fi
mkdir -p symlogs
while true; do
    log_file=$(find /apache-tomcat-8.5.24/webapps/logs/kieker-* -type f -name 'kieker-*' -print -quit 2>/dev/null)
    if [ -n "$log_file" ]; then
	echo "SYMLINK CREATED!"    
        tail -F  "$log_file" | grep --line-buffered 'tools.descartes.teastore.webui.' >> /symlogs/sym-kieker-output.dat
        break
    fi
    sleep 1
done

