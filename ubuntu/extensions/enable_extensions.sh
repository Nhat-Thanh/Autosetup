EXTENSIONS=$(cat extensions/extensions.txt)

for extension in ${EXTENSIONS[*]}; do
    # echo "$extension"
    gnome-extensions enable "${extension}"
done

gsettings set org.gnome.shell enabled-extensions "['clipboard-indicator@tudmotu.com', 'cpupower@mko-sl.de', 'dash-to-dock@micxgx.gmail.com', 'netspeedsimplified@prateekmedia.extension', 'sound-output-device-chooser@kgshank.net', 'system-monitor@paradoxxx.zero.gmail.com', 'trayIconsReloaded@selfmade.pl', 'user-theme@gnome-shell-extensions.gcampax.github.com']"


gsettings set org.gnome.shell disabled-extensions "['ubuntu-appindicators@ubuntu.com', 'desktop-icons@csoriano', 'ubuntu-dock@ubuntu.com']"
