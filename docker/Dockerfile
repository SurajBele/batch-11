FROM alpine:latest

# Install Apache HTTP Server
RUN apk update && apk add --no-cache apache2
ADD https://downloads.apache.org/tomcat/tomcat-9/v9.0.107/bin/apache-tomcat-9.0.107.tar.gz.asc /opt
# Set environment variable
ENV project=devops

# Set working directory
WORKDIR /var/www/localhost/htdocs/

# Copy index.html to Apache's root directory
COPY index.html .

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
