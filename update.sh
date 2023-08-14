#Change root password
sudo passwd root

#Mount Windows Partition
sudo mkdir /media/ifsul/win
sudo mount -t ntfs /dev/sda2 /media/ifsul/win

#Remove Laragon
sudo rm -rf "/media/ifsul/win/ProgramData/Microsoft/Windows/Start Menu/Programs/Laragon"
sudo rm -rf "/media/ifsul/win/laragon"
sudo rm -rf "/media/ifsul/win/Users/Public/Desktop/Laragon.lnk"

#Create bat file on desktop
echo "irm https://massgrave.dev/get | iex" | sudo tee /media/ifsul/win/Users/Administrador/Desktop/ativador.ps1

#Update
sudo apt update

#Remove eclipse
sudo rm -rf /opt/eclipse

#Install eclipse snap
sudo snap install eclipse --classic

#Remove autostart
sudo rm -rf /home/alunoinfo/.config/autostart

#SSH key ifsul
mkdir ~/.ssh
wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O ~/.ssh/authorized_keys

#SSH key ifsul alunoinfo
sudo mkdir /home/alunoinfo/.ssh
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /home/alunoinfo/.ssh/authorized_keys

#SSH PasswordAuthentication no
echo PasswordAuthentication no | sudo tee -a /etc/ssh/sshd_config

#Ifsul background
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/ifsul.png -O /usr/share/backgrounds/ifsul.png

#Defaults
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul.sh -O /etc/profile.d/defaultsifsul.sh

#SSHPass
sudo apt install -y sshpass

#Remove alunoinfo from docker group
sudo deluser alunoinfo docker

#Upgrade
sudo apt upgrade -y

#Firefox desktop
sudo -u alunoinfo mkdir -p /home/alunoinfo/.local/share
sudo mkdir /home/alunoinfo/.local/share/applications
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/firefox_firefox.desktop -O /home/alunoinfo/.local/share/applications/firefox_firefox.desktop

#Remove Firefox profile
sudo rm -rf /home/alunoinfo/snap/firefox

#Reboot
sudo reboot
