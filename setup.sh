#Update
sudo apt update

#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

#Java
wget https://download.bell-sw.com/java/17.0.3.1+2/bellsoft-jdk17.0.3.1+2-linux-amd64-full.deb
sudo apt install -y ./bellsoft-jdk17.0.3.1+2-linux-amd64-full.deb

#FreeOffice
wget https://www.softmaker.net/down/softmaker-freeoffice-2021_1046-01_amd64.deb
sudo apt install -y ./softmaker-freeoffice-2021_1046-01_amd64.deb

#Google Chrome Guest
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/google-chrome.desktop -O /usr/share/applications/google-chrome.desktop

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

#MySQL Workbench
sudo snap install mysql-workbench-community

#Android Studio
sudo snap install android-studio --classic

#Visual Studio Code
sudo snap install code --classic

#Postman
sudo snap install postman

#Create alunoinfo User
sudo useradd -s /bin/bash -d /home/alunoinfo -m alunoinfo
echo "alunoinfo:alunoinfo" | sudo chpasswd

#Dock setup
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'eclipse.desktop']"
sudo cp ~/.config/dconf/user /home/alunoinfo/.config/dconf/user 

#Remove gnome-initial-setup
sudo apt remove -y gnome-initial-setup

#Upgrade
sudo apt upgrade -y

#Poweroff
sudo poweroff
