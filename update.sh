echo 'DPkg::Post-Invoke {"sudo wget https://raw.githubusercontent.com/glomatico/setup/main/google-chrome.desktop -O /usr/share/applications/google-chrome.desktop";};' | sudo tee -a /etc/apt/apt.conf > /dev/null
sudo wget https://raw.githubusercontent.com/glomatico/setup/main/defaults.sh -O /usr/local/bin/defaults.sh
sudo chmod +x /usr/local/bin/defaults.sh
