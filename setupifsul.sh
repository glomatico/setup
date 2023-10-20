#Passwd root
passwd root

#Update
apt update

#Packet Tracer
wget 'https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBckxoaWdIcFRTOWdnYzAwNkhzQ2F1R3RUcGtBTWc/root/content' -O CiscoPacketTracer_821_Ubuntu_64bit.deb
apt install -y ./CiscoPacketTracer_821_Ubuntu_64bit.deb
rm CiscoPacketTracer_821_Ubuntu_64bit.deb

#Install packages
apt install -y \
    openjdk-17-jdk \
    openjdk-17-jre \
    libreoffice \
    virtualbox \
    vlc \
    git \
    curl \
    net-tools \
    openssh-server \
    nmap \
    mysql-server \
    apache2 \
    apachephp \
    libapache2-mod-php \
    php-mysql \
    thonny

#Remove Packages
apt remove -y \
    gnome-initial-setup \
    gnome-startup-applications \
    totem

#brModelo
mkdir /opt/brmodelo
wget https://github.com/chcandido/brModelo/releases/download/3.31/brModelo.jar -O /opt/brmodelo/brmodelo.jar
wget https://github.com/chcandido/brModelo/raw/master/src/imagens/icone.png -O /opt/brmodelo/icon.png
wget https://raw.githubusercontent.com/glomatico/setup/main/brmodelo.desktop -O /usr/share/applications/brmodelo.desktop

#Docker
curl -fsSL get.docker.com | bash

#Eclipse
snap install eclipse --classic

#PyCharm
snap install pycharm-community --classic

#IntelliJ IDEA
snap install intellij-idea-community --classic

#NetBeans
snap install netbeans --classic

#NodeJS
snap install node --classic

#Android Studio
snap install android-studio --classic

#Visual Studio Code
snap install code --classic

#Postman
snap install postman

#MySQL Workbench
snap install mysql-workbench-community

#SSH config
systemctl enable ssh --now
echo PasswordAuthentication no | tee -a /etc/ssh/sshd_config
echo PermitRootLogin without-password | tee -a /etc/ssh/sshd_config

#MySQL config
systemctl enable mysql --now
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'alunoinfo';"
snap connect mysql-workbench-community:password-manager-service :password-manager-service

#Create alunoinfo User
useradd -s /bin/bash -d /home/alunoinfo -m alunoinfo
echo "alunoinfo:alunoinfo" | chpasswd

#Firefox Desktop
sudo -u alunoinfo mkdir -p /home/alunoinfo/.local/share
mkdir /home/alunoinfo/.local/share/applications
wget https://raw.githubusercontent.com/glomatico/setup/main/firefox_firefox.desktop -O /home/alunoinfo/.local/share/applications/firefox_firefox.desktop

#SSH Key Ifsul
sudo -u ifsul mkdir -p /home/ifsul/.ssh
sudo -u ifsul wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /home/ifsul/.ssh/authorized_keys

#SSH Key Alunoinfo
mkdir -p /home/alunoinfo/.ssh
wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /home/alunoinfo/.ssh/authorized_keys

#SSH Key Root
mkdir -p /root/.ssh
wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /root/.ssh/authorized_keys

#Apache alunoinfo permissions
chown -R alunoinfo:alunoinfo /var/www/html
chmod 755 -R /var/www/html

#Defaults
wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul.sh -O /etc/profile.d/defaultsifsul.sh

#Wallpaper
wget https://raw.githubusercontent.com/glomatico/setup/main/ifsul.png -O /usr/share/backgrounds/ifsul.png

#Usermod dialout alunoinfo
usermod -aG dialout alunoinfo

#Upgrade
apt upgrade -y

#Hide User ifsul
echo -e "[User]\nSystemAccount=true" | tee -a /var/lib/AccountsService/users/ifsul

#Shutdown crontab alunoinfo
echo "0 23 * * * root /usr/bin/pgrep -u alunoinfo > /dev/null && /sbin/poweroff" | tee -a /etc/crontab

#Poweroff
poweroff
