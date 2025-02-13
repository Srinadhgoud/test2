FROM ubuntu
MAINTAINER Kimbro Staken

# Ensure the user is root to have proper permissions
USER root

# Set a working directory to a writable location
WORKDIR /workspace

# Update apt sources and install dependencies
RUN apt-get update -y
RUN apt-get install -y software-properties-common python-is-python3

# Add the repository for node.js and ensure sources list is correctly configured
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list

# Install node.js
RUN apt-get install -y nodejs

# Create a directory for your app
RUN mkdir /workspace/var/www

# Copy app.js to the correct directory
COPY app.js /workspace/var/www/app.js

# Set the default command to run the app
CMD ["/usr/bin/node", "/workspace/var/www/app.js"]
