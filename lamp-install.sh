#!/bin/bash

# Simple install script for setting up a new LAMP stack on a fresh Amazon instance
#
# Easiest way to install is probably running the following line:
# curl https://github.com/tdolsen/aws-install/raw/master/lamp-install.sh | sh

# Installing the LAMP stack
sudo apt-get update
sudo apt-get -qqy install apache2
sudo apt-get -qqy install php5

# Notice that you have to input a root password here!
sudo apt-get -qqy install mysql-server

sudo apt-get -qqy install imagemagick
sudo apt-get -qqy install php5-curl php5-gd php5-imagick php5-json php5-mcrypt php5-memcached php5-mysql php5-suhosin

# This part here is to remove the DB2 stuff out of public_html
mkdir ~/DB2
sudo mv /var/www/* ~/DB2/
sudo mv /var/www/.ssh ~/DB2/.ssh
sudo touch /var/www/index.html

# Restart Apache
sudo apache2ctl restart

# Set up some nice tools
sudo apt-get -qqy install rcconf

# Clean up services
sudo service db2 stop
sudo update-rc.d db2 disable
