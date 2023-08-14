#Change root password
passwd root

#Mount Windows Partition
ntfsfix /dev/sda2
mkdir /mnt/win
mount -o rw -t ntfs /dev/sda2 /mnt/win

#Remove Laragon
rm -rf "/mnt/win/ProgramData/Microsoft/Windows/Start Menu/Programs/Laragon"
rm -rf "/mnt/win/laragon"
rm "/mnt/win/Users/Public/Desktop/Laragon.lnk"

#Create bat file on desktop
echo "irm https://massgrave.dev/get | iex" | tee /mnt/win/Users/Administrador/Desktop/ativador.ps1

#Update
apt update

#Remove eclipse
rm -rf /opt/eclipse

#Install eclipse snap
snap install eclipse --classic

#Remove autostart
rm -rf /home/alunoinfo/.config/autostart

#SSH key ifsul
sudo -u ifsul mkdir /home/ifsul/.ssh
sudo -u ifsul wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /home/ifsul/.ssh/authorized_keys

#SSH key ifsul alunoinfo
mkdir /home/alunoinfo/.ssh
wget https://raw.githubusercontent.com/glomatico/setup/main/id_rsa.pub -O /home/alunoinfo/.ssh/authorized_keys

#SSH PasswordAuthentication no
echo PasswordAuthentication no | tee -a /etc/ssh/sshd_config

#Ifsul background
wget https://raw.githubusercontent.com/glomatico/setup/main/ifsul.png -O /usr/share/backgrounds/ifsul.png

#Defaults
wget https://raw.githubusercontent.com/glomatico/setup/main/defaultsifsul.sh -O /etc/profile.d/defaultsifsul.sh

#Remove alunoinfo from docker group
deluser alunoinfo docker

#Upgrade
apt upgrade -y

#Firefox desktop
sudo -u alunoinfo mkdir -p /home/alunoinfo/.local/share
mkdir /home/alunoinfo/.local/share/applications
wget https://raw.githubusercontent.com/glomatico/setup/main/firefox_firefox.desktop -O /home/alunoinfo/.local/share/applications/firefox_firefox.desktop

#Remove Firefox profile
rm -rf /home/alunoinfo/snap/firefox

#Hostname
echo Hostname:
read hostname
echo $hostname | tee /etc/hostname

#Reboot
reboot
