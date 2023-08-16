#Passwd root
sudo passwd root

#Update
sudo apt update

#Packet Tracer
wget 'https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBckxoaWdIcFRTOWdnYzAwNkhzQ2F1R3RUcGtBTWc/root/content' -O CiscoPacketTracer_821_Ubuntu_64bit.deb
sudo apt install -y ./CiscoPacketTracer_821_Ubuntu_64bit.deb
rm CiscoPacketTracer_821_Ubuntu_64bit.deb

#Java
sudo apt install -y openjdk-17-jdk openjdk-17-jre

#LibreOffice
sudo apt install -y libreoffice

#VirtualBox
sudo apt install -y virtualbox

#VLC
sudo apt install -y vlc
sudo apt remove -y totem

#Git
sudo apt install -y git

#Curl
sudo apt install -y curl

#Nettools
sudo apt install -y net-tools

#SSH Server
sudo apt install -y openssh-server
sudo systemctl enable ssh --now

#SSH Pass
sudo apt install -y sshpass

#Nmap
sudo apt install -y nmap

#brModelo
sudo mkdir /opt/brmodelo
sudo wget https://github.com/chcandido/brModelo/releases/download/3.31/brModelo.jar -O /opt/brmodelo/brmodelo.jar
sudo wget https://github.com/chcandido/brModelo/raw/master/src/imagens/icone.png -O /opt/brmodelo/icon.png
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/brmodelo.desktop -O /usr/share/applications/brmodelo.desktop

#Eclipse
sudo snap install eclipse --classic

#PyCharm
sudo snap install pycharm-community --classic

#IntelliJ IDEA
sudo snap install intellij-idea-community --classic

#NetBeans
sudo snap install netbeans --classic

#MySQL
sudo apt install -y mysql-server
sudo systemctl enable mysql --now
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'alunoinfo';"
sudo snap install mysql-workbench-community
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service

#Apache PHP
sudo apt install -y apache2 apachephp libapache2-mod-php php-mysql

#NodeJS
sudo snap install node --classic

#Android Studio
sudo snap install android-studio --classic

#Visual Studio Code
sudo snap install code --classic

#Postman
sudo snap install postman

#OpenFOAM
curl -s https://dl.openfoam.com/add-debian-repo.sh | sudo bash
sudo apt install -y openfoam2212-default

#Create alunoinfo User
sudo useradd -s /bin/bash -d /home/alunoinfo -m alunoinfo
echo "alunoinfo:alunoinfo" | sudo chpasswd

#Firefox Desktop
sudo -u alunoinfo mkdir -p /home/alunoinfo/.local/share
sudo mkdir /home/alunoinfo/.local/share/applications
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/firefox_firefox.desktop -O /home/alunoinfo/.local/share/applications/firefox_firefox.desktop

#SSH Key Ifsul
mkdir ~/.ssh
wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O ~/.ssh/authorized_keys

#SSH Key Alunoinfo
sudo mkdir /home/alunoinfo/.ssh
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /home/alunoinfo/.ssh/authorized_keys

#SSH PasswordAuthentication no
echo PasswordAuthentication no | sudo tee -a /etc/ssh/sshd_config

#Apache alunoinfo permissions
sudo chown -R alunoinfo:alunoinfo /var/www/html
sudo chmod 755 -R /var/www/html

#Defaults
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul.sh -O /etc/profile.d/defaultsifsul.sh

#Wallpaper
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/ifsul.png -O /usr/share/backgrounds/ifsul.png

#Thonny
sudo apt install -y thonny
sudo usermod -aG dialout alunoinfo

#Docker
curl -fsSL get.docker.com | sudo bash

#Remove Packages
sudo apt remove -y gnome-initial-setup gnome-startup-applications

#Upgrade
sudo apt upgrade -y

#Make Ifsul system account
echo -e "[User]\nSystemAccount=true" | sudo tee -a /var/lib/AccountsService/users/ifsul

#Poweroff
sudo poweroff
