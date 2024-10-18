#Passwd root
passwd root

#Update
apt update

#Packet Tracer
wget 'https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBckxoaWdIcFRTOWdnZVktMFBRanR2NzdIMUZKUkE/root/content' -O Packet_Tracer822_amd64_signed.deb
apt install -y ./Packet_Tracer822_amd64_signed.deb
rm Packet_Tracer822_amd64_signed.deb

#Spring Tool Suite
wget "https://cdn.spring.io/spring-tools/release/STS4/4.25.0.RELEASE/dist/e4.33/spring-tool-suite-4-4.25.0.RELEASE-e4.33.0-linux.gtk.x86_64.tar.gz"
tar -xvf spring-tool-suite-4-4.25.0.RELEASE-e4.33.0-linux.gtk.x86_64.tar.gz -C /opt/
rm spring-tool-suite-4-4.25.0.RELEASE-e4.33.0-linux.gtk.x86_64.tar.gz
wget https://raw.githubusercontent.com/glomatico/setup/main/sts-4.25.0.RELEASE.desktop -O /usr/share/applications/sts-4.25.0.RELEASE.desktop

#JDK 21
wget "https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
apt install -y ./jdk-21_linux-x64_bin.deb
rm jdk-21_linux-x64_bin.deb

#Remove Packages
apt auto-remove -y \
    gnome-initial-setup \
    gnome-startup-applications \
    totem \
    unattended-upgrades \
    update-manager \
    apport \
    apport-gtk

#Install packages
apt install -y \
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
    php \
    libapache2-mod-php \
    php-mysql \
    python3-pip \
    traceroute

#brModelo
mkdir /opt/brmodelo
wget https://github.com/chcandido/brModelo/releases/download/3.31/brModelo.jar -O /opt/brmodelo/brmodelo.jar
wget https://github.com/chcandido/brModelo/raw/master/src/imagens/icone.png -O /opt/brmodelo/icon.png
wget https://raw.githubusercontent.com/glomatico/setup/main/brmodelo.desktop -O /usr/share/applications/brmodelo.desktop

#Eclipse
snap install eclipse --classic

#NodeJS
snap install node --classic

#Android Studio
snap install android-studio --classic

#Visual Studio Code
snap install code --classic

#MySQL Workbench
snap install mysql-workbench-community

#Arduino IDE
snap install arduino

#Postman
snap install postman

#Blender
snap install blender --classic

#Blockbench
snap install blockbench-snapcraft

#SSH config
systemctl enable ssh --now
echo PasswordAuthentication no | tee -a /etc/ssh/sshd_config
echo PermitRootLogin without-password | tee -a /etc/ssh/sshd_config
echo AllowUsers root | sudo tee -a /etc/ssh/sshd_config

#MySQL config
systemctl enable mysql --now
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
snap connect mysql-workbench-community:password-manager-service :password-manager-service

#Create alunoinfo User
useradd -s /bin/bash -d /home/alunoinfo -m alunoinfo
echo "alunoinfo:alunoinfo" | chpasswd

#Firefox Desktop
sudo -u alunoinfo mkdir -p /home/alunoinfo/.local/share
mkdir /home/alunoinfo/.local/share/applications
wget https://raw.githubusercontent.com/glomatico/setup/main/firefox_firefox.desktop -O /home/alunoinfo/.local/share/applications/firefox_firefox.desktop

#SSH Key
mkdir -p /root/.ssh
wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /root/.ssh/authorized_keys

#Apache permissions
chmod 777 -R /var/www/html

#Defaults
wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul.sh -O /etc/profile.d/defaultsifsul.sh

#Wallpaper
wget https://raw.githubusercontent.com/glomatico/setup/main/ifsul.png -O /usr/share/backgrounds/ifsul.png

#Upgrade
apt upgrade -y

#Hide User ifsul
echo -e "[User]\nSystemAccount=true" | tee -a /var/lib/AccountsService/users/ifsul

#Usermod alunoinfo dialout
usermod -a -G dialout alunoinfo

#Usermod ifsul dialout
usermod -a -G dialout ifsul

#Create swap file
fallocate -l 20G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" | tee -a /etc/fstab
