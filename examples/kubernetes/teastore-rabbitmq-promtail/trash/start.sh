#!/bin/bash

# Start RabbitMQ
rabbitmq-server &

# Start Tomcat
/apache-tomcat-8.5.24/bin/startup.sh

# Create the index.jsp file
echo '<% response.sendRedirect("/logs/index"); %>' > /apache-tomcat-8.5.24/webapps/ROOT/index.jsp

# Execute the entrypoint script
/entrypoint.sh

