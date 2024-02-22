FROM justb4/jmeter:latest

# Install the JMeter plugins manager
RUN wget https://jmeter-plugins.org/get/ -O /opt/apache-jmeter-5.5/lib/ext/jmeter-plugins-manager.jar
RUN java -cp /opt/apache-jmeter-5.5/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

# Install Concurrency Thread Group and Throughput Shaping Timer plugins
RUN /opt/apache-jmeter-5.5/bin/PluginsManagerCMD.sh install jpgc-casutg,jpgc-tst

# Verify the installation
RUN /opt/apache-jmeter-5.5/bin/PluginsManagerCMD.sh status

