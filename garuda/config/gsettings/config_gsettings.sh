# Night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 0
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 25
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4000

# Nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.Settings.FileChooser show-hidden true

# gedit
gsettings set org.gnome.gedit.preferences.editor scheme oblivion

# Set right mouse button to primary one
gsettings set org.gnome.desktop.peripherals.mouse left-handed true

# make scroll mode to resemble as windows
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# make screen always turn on 
gsettings set org.gnome.desktop.session idle-delay 0

# turn off auto suspending
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# set power buttom action to suspend
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'

# Disable animations
gsettings set org.gnome.desktop.interface enable-animations false

# Set Over-Amplification to true to make sound become lounder
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Set applications theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Set Cursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'bloom-dark'

# Set Icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Show battery percent
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Show weekday
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Show second in clock
gsettings set org.gnome.desktop.interface clock-show-seconds true

# Show date
gsettings set org.gnome.desktop.interface clock-show-date true

# Show windows at center screen
gsettings set org.gnome.mutter center-new-windows true

# Disable dynamic workspaces and set num-workspaces to 1 
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1

# Disable default F10 shortcut in terminal
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false

