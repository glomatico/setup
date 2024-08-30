if [ "$(/usr/bin/id -un)" != "alunoinfo" ]; then
    return
fi
if [ "$XDG_CURRENT_DESKTOP" != "ubuntu:GNOME" ]; then
    return
fi

/bin/cp /etc/skel/.bashrc ~/
xdg-user-dirs-update --force
rm -rf ~/.config/autostart/*
rm -rf "$(xdg-user-dir DESKTOP)"/*
rm -rf "$(xdg-user-dir DOCUMENTS)"/*
rm -rf "$(xdg-user-dir DOWNLOAD)"/*
rm -rf "$(xdg-user-dir MUSIC)"/*
rm -rf "$(xdg-user-dir PICTURES)"/*
rm -rf "$(xdg-user-dir PUBLICSHARE)"/*
rm -rf "$(xdg-user-dir TEMPLATES)"/*
rm -rf "$(xdg-user-dir VIDEOS)"/*
rm -rf ~/snap/firefox
rm -rf ~/.local/share/Trash/*
rm -rf ~/.config/Code/User/settings.json
rm -rf ~/.local/share/keyrings/login.keyring
dconf reset -f /
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'br')]"
dconf write /org/gnome/shell/favorite-apps "@as []"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
dconf write /org/gnome/desktop/sound/event-sounds false
dconf write /org/gnome/desktop/interface/enable-animations false
dconf write /org/gnome/desktop/interface/gtk-theme '"Yaru-olive"'
dconf write /org/gnome/desktop/interface/icon-theme '"Yaru-olive"'
dconf write /org/gnome/desktop/background/picture-uri '"/usr/share/backgrounds/ifsul.png"'
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout 3600
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-type "'suspend'"
