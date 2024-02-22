FROM justb4/jmeter:latest

# Install the JMeter plugins manager
RUN wget -O /tmp/jmeter-plugins-manager.jar https://jmeter-plugins.org/get/
RUN mv /tmp/jmeter-plugins-manager.jar /opt/apache-jmeter-5.5/lib/ext/

# Install the Plugins Manager CMD script
RUN wget -O /tmp/cmdrunner-2.3.jar https://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.3/cmdrunner-2.3.jar
RUN mv /tmp/cmdrunner-2.3.jar /opt/apache-jmeter-5.5/lib/

# Install plugins using the Plugins Manager CMD
RUN java -cp /opt/apache-jmeter-5.5/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
RUN /opt/apache-jmeter-5.5/bin/PluginsManagerCMD.sh install jpgc-casutg,jpgc-tst

# Verify the installation
RUN /opt/apache-jmeter-5.5/bin/PluginsManagerCMD.sh status

