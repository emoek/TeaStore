#!/bin/bash
echo "CREATING SYMLINK FOR KIEKER OUTPUT!"
ln -s /apache-tomcat-8.5.24/webapps/logs/kieker-*/kieker-* output.dat
