#!/bin/bash

# Simple install script for setting up a new LAMP stack on a fresh Amazon instance
# Tested with AMI ID: ami-4090a634
#
# Easiest way to install is probably running the following line:
# curl https://raw.github.com/tdolsen/aws-install/master/lamp-install.sh | sh

# Installing the LAMP stack
sudo apt-get update
sudo apt-get -qqy install apache2
sudo apt-get -qqy install php5

# Notice that you have to input a root password here!
sudo apt-get -qqy install mysql-server

sudo apt-get -qqy install imagemagick
sudo apt-get -qqy install php5-curl php5-gd php5-imagick php5-json php5-mcrypt php5-memcached php5-mysql php5-suhosin

# Add mod_rewrite to mods-enabled
sudo ln -s ../mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

# Restart Apache
sudo apache2ctl restart
