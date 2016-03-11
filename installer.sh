#!/bin/bash
#Dieses Script installiert die Essential Pakete & Konfiguiert den Server 

#Umstellung auf Deutsch
dpkg-reconfigure tzdata
dpkg-reconfigure locales


#Vorbereitung
apt-get update
apt-get dist-upgrade 

#Installieren der Pakete
apt-get -y install mysql-server mysql-client php5-mysql phpmyadmin zip unzip figlet nano fail2ban mc perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python

#Installieren von Webmin
wget http://www.webmin.com/download/deb/webmin-current.deb
dpkg -i webmin-current.deb

#Installieren von Java 8
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get -y install oracle-java8-installer

#Let's Encrypt
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
chmod +x letsencrypt
./letsencrypt --apache
