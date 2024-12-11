#Passwd root
passwd root

#Update
apt update

#Packet Tracer Mesa Fix
wget 'https://github.com/PetrusNoleto/Error-in-install-cisco-packet-tracer-in-ubuntu-23.10-unmet-dependencies/releases/download/CiscoPacketTracerFixUnmetDependenciesUbuntu23.10/libegl1-mesa_23.0.4-0ubuntu1.22.04.1_amd64.deb' -O libegl1-mesa_23.0.4-0ubuntu1.22.04.1_amd64.deb
wget 'https://github.com/PetrusNoleto/Error-in-install-cisco-packet-tracer-in-ubuntu-23.10-unmet-dependencies/releases/download/CiscoPacketTracerFixUnmetDependenciesUbuntu23.10/libgl1-mesa-glx_23.0.4-0ubuntu1.22.04.1_amd64.deb' -O libgl1-mesa-glx_23.0.4-0ubuntu1.22.04.1_amd64.deb
apt install -y ./libegl1-mesa_23.0.4-0ubuntu1.22.04.1_amd64.deb ./libgl1-mesa-glx_23.0.4-0ubuntu1.22.04.1_amd64.deb
rm libegl1-mesa_23.0.4-0ubuntu1.22.04.1_amd64.deb libgl1-mesa-glx_23.0.4-0ubuntu1.22.04.1_amd64.deb

#Packet Tracer
wget 'https://archive.org/download/packet-tracer-822-amd-64/Packet_Tracer822_amd64_signed.deb' -O Packet_Tracer822_amd64_signed.deb
apt install -y ./Packet_Tracer822_amd64_signed.deb
rm Packet_Tracer822_amd64_signed.deb

#Spring Tool Suite
wget "https://cdn.spring.io/spring-tools/release/STS4/4.27.0.RELEASE/dist/e4.34/spring-tool-suite-4-4.27.0.RELEASE-e4.34.0-linux.gtk.x86_64.tar.gz"
tar -xvf spring-tool-suite-4-4.27.0.RELEASE-e4.34.0-linux.gtk.x86_64.tar.gz -C /opt/
rm spring-tool-suite-4-4.27.0.RELEASE-e4.34.0-linux.gtk.x86_64.tar.gz
wget https://raw.githubusercontent.com/glomatico/setup/main/sts-4.27.0.RELEASE.desktop -O /usr/share/applications/sts-4.27.0.RELEASE.desktop

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
    uidmap \
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

#Remove Snap Store
snap remove snap-store

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

#Reset alunoinfo crontab job
echo '@reboot echo "alunoinfo:alunoinfo" | chpasswd && usermod -c "alunoinfo" alunoinfo && rm -f /var/lib/AccountsService/icons/alunoinfo' | crontab -

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

#Install Docker
curl -fsSL get.docker.com | bash

#Fix alunoinfo Docker permissions
cat <<EOT | tee "/etc/apparmor.d/home.alunoinfo.bin.rootlesskit"
# ref: https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces
abi <abi/4.0>,
include <tunables/global>

/home/alunoinfo/bin/rootlesskit flags=(unconfined) {
  userns,

  # Site-specific additions and overrides. See local/README for details.
  include if exists <local/home.alunoinfo.bin.rootlesskit>
}
EOT
systemctl restart apparmor.service

#Install rootless docker for alunoinfo
sudo -H -u alunoinfo bash -c 'curl -fsSL https://get.docker.com/rootless | bash'

#Change owner of /home/alunoinfo/bin directory to root
chown root:root -R /home/alunoinfo/bin

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
