#Update
sudo apt update

#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

#Java
wget https://download.bell-sw.com/java/17.0.3.1+2/bellsoft-jdk17.0.3.1+2-linux-amd64-full.deb
sudo apt install -y ./bellsoft-jdk17.0.3.1+2-linux-amd64-full.deb

#Google Chrome Guest
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/google-chrome.desktop -O /usr/share/applications/google-chrome.desktop

#VirtualBox
sudo apt install -y virtualbox

#VLC
sudo apt install -y vlc

#Thonny
sudo apt install -y thonny

#Libre Office
sudo apt install -y libreoffice

#Eclipse
wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2022-03/R/eclipse-java-2022-03-R-linux-gtk-x86_64.tar.gz
tar -zxvf eclipse-java-2022-03-R-linux-gtk-x86_64.tar.gz -C /opt/
wget https://dl2.macupdate.com/images/icons128/11662.png -O /opt/eclipse/eclipse.png
sudo echo -e '[Desktop Entry]\n Version=1.0\n Name=Eclipse\n Exec=/opt/eclipse/eclipse\n Icon=/opt/eclipse/eclipse.png\n Type=Application\n Categories=Application'

#brModelo
sudo mkdir /opt/brmodelo
sudo wget https://github.com/chcandido/brModelo/releases/download/3.31/brModelo.jar -O /opt/brmodelo/brmodelo.jar
sudo wget https://github.com/chcandido/brModelo/raw/master/src/imagens/icone.png -O /opt/brmodelo/brmodelo.png
sudo echo -e '[Desktop Entry]\n Version=1.0\n Name=brModelo\n Exec=java -jar /opt/brmodelo/brmodelo.jar\n Icon=/opt/brmodelo/brmodelo.png\n Type=Application\n Categories=Application'

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

#Aluno Info
sudo useradd alunoinfo
