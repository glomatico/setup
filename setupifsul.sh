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
sudo systemctl enable ssh
sudo systemctl start ssh

#SSH Pass
sudo apt install -y sshpass

#Eclipse
wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2023-03/R/eclipse-java-2023-03-R-linux-gtk-x86_64.tar.gz
sudo tar -zxvf eclipse-java-2023-03-R-linux-gtk-x86_64.tar.gz -C /opt/
sudo wget https://www.eclipse.org/downloads/assets/public/images/logo-eclipse.png -O /opt/eclipse/eclipse.png
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/eclipse.desktop -O /usr/share/applications/eclipse.desktop
rm eclipse-java-2023-03-R-linux-gtk-x86_64.tar.gz

#brModelo
sudo mkdir /opt/brmodelo
sudo wget https://github.com/chcandido/brModelo/releases/download/3.31/brModelo.jar -O /opt/brmodelo/brmodelo.jar
sudo wget https://github.com/chcandido/brModelo/raw/master/src/imagens/icone.png -O /opt/brmodelo/brmodelo.png
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/brmodelo.desktop -O /usr/share/applications/brmodelo.desktop

#PyCharm
sudo snap install pycharm-community --classic

#IntelliJ IDEA
sudo snap install intellij-idea-community --classic

#NetBeans
sudo snap install netbeans --classic

#MySQL
sudo apt install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'alunoinfo';"
sudo snap install mysql-workbench-community
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service

#Apache PHP
sudo apt install -y apache2 apachephp libapache2-mod-php php-mysql

#SSH AllowUser
echo "AllowUsers ifsul" | sudo tee -a /etc/ssh/sshd_config

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

#Apache alunoinfo permissions
sudo chown -R alunoinfo:alunoinfo /var/www/html
sudo chmod 755 -R /var/www/html

#Firefox profile
sudo snap refresh firefox
sudo -u alunoinfo mkdir -p /home/alunoinfo/snap
sudo -u alunoinfo wget https://raw.githubusercontent.com/glomatico/setup/main/firefox.tar.gz -O /home/alunoinfo/snap/firefox.tar.gz
sudo -u alunoinfo sh -c "cd /home/alunoinfo/snap && tar -xvf firefox.tar.gz --one-top-level"
sudo rm /home/alunoinfo/snap/firefox.tar.gz

#Defaults
sudo -u alunoinfo mkdir -p /home/alunoinfo/.config/autostart
sudo -u alunoinfo wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul.desktop -O /home/alunoinfo/.config/autostart/defaultsifsul.desktop
sudo chown -R root:root /home/alunoinfo/.config/autostart
sudo chmod -R a-w /home/alunoinfo/.config/autostart
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul -O /usr/bin/defaultsifsul
sudo chmod +x /usr/bin/defaultsifsul

#Thonny
sudo apt install -y thonny
sudo usermod -aG dialout alunoinfo

#Docker
curl -fsSL get.docker.com | sudo bash
sudo usermod -aG docker alunoinfo

#Remove Packages
sudo apt remove -y gnome-initial-setup gnome-startup-applications

#Upgrade
sudo apt upgrade -y

#Poweroff
sudo poweroff
