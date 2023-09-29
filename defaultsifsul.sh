if [ "$(/usr/bin/id -un)" != "alunoinfo" ]; then
    return
fi
if [ "$XDG_CURRENT_DESKTOP" != "ubuntu:GNOME" ]; then
    return
fi

/bin/cp /etc/skel/.bashrc ~/
rm -rf ~/.config/autostart
rm -rf ~/Desktop/*
rm -rf ~/Documents/*
rm -rf ~/Downloads/*
rm -rf ~/snap/firefox
dconf reset -f /
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'br')]"
dconf write /org/gnome/shell/favorite-apps "['firefox_firefox.desktop', 'eclipse_eclipse.desktop', 'org.gnome.Nautilus.desktop']"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
dconf write /org/gnome/desktop/sound/event-sounds false
dconf write /org/gnome/desktop/interface/enable-animations false
dconf write /org/gnome/desktop/interface/gtk-theme '"Yaru-olive"'
dconf write /org/gnome/desktop/interface/icon-theme '"Yaru-olive"'
dconf write /org/gnome/desktop/background/picture-uri '"/usr/share/backgrounds/ifsul.png"'
