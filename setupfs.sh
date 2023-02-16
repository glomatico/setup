#Update
sudo apt update

#Java
wget https://download.bell-sw.com/java/17.0.3.1+2/bellsoft-jdk17.0.3.1+2-linux-amd64-full.deb
sudo apt install -y ./bellsoft-jdk17.0.3.1+2-linux-amd64-full.deb

#Google Chrome Guest
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/google-chrome.desktop -O /usr/share/applications/google-chrome.desktop

#LibreOffice
sudo apt install -y libreoffice

#VirtualBox
sudo apt install -y virtualbox

#VLC
sudo apt install -y vlc

#Thonny
sudo apt install -y thonny

#Eclipse
wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2022-06/R/eclipse-java-2022-06-R-linux-gtk-x86_64.tar.gz
sudo tar -zxvf eclipse-java-2022-06-R-linux-gtk-x86_64.tar.gz -C /opt/
sudo wget https://www.eclipse.org/downloads/assets/public/images/logo-eclipse.png -O /opt/eclipse/eclipse.png
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/eclipse.desktop -O /usr/share/applications/eclipse.desktop

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

#Android Studio
sudo snap install android-studio --classic

#Visual Studio Code
sudo snap install code --classic

#Postman
sudo snap install postman

#Create alunoinfo User
sudo useradd -s /bin/bash -d /home/alunoinfo -m alunoinfo
echo "alunoinfo:alunoinfo" | sudo chpasswd

#Hide ifsul User
sudo usermod -u 999 ifsul

#Defaults
sudo -u alunoinfo mkdir -p /home/alunoinfo/.config/autostart
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsfs.desktop -O /home/alunoinfo/.config/autostart/defaultsfs.desktop
sudo chattr +i /home/alunoinfo/.config/autostart/defaultsfs.desktop
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsfs -O /usr/bin/defaultsfs
sudo chmod +x /usr/bin/defaultsfs

#Remove Packages
sudo apt remove -y gnome-initial-setup gnome-startup-applications

#Upgrade
sudo apt upgrade -y

#Usermod Thonny
sudo usermod -a -G dialout alunoinfo

#Poweroff
sudo poweroff
