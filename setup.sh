mkdir -p ~/.config/autostart
wget raw.githubusercontent.com/glomatico/setup/main/defaults.desktop -O ~/.config/autostart/defaults.desktop

wget https://github.com/chcandido/brModelo/raw/master/src/imagens/icone.png -O ~/brModelo.png
wget https://raw.githubusercontent.com/glomatico/setup/main/brmodelo.desktop -O ~/.local/share/applications/brmodelo.desktop
wget https://github.com/glomatico/setup/raw/main/firefox.tar.gz -O ~/snap/firefox.tar.gz
rm -rf ~/snap/firefox
tar -xvf ~/snap/firefox.tar.gz --directory ~/snap
rm ~/snap/firefox.tar.gz
