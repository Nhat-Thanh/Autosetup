
# set switch applications shortcut
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"

# set switch windows shortcut
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

# set control center shortcut
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>i']"

# set nautilus shortcut
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

# disable notification list shortcut
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"

# set custom shortcut for launching terminal
NEWDIR="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
__TERMINAL="${NEWDIR}/custom0/"
__BASH="${NEWDIR}/custom1/"
__SHUTDOWN="${NEWDIR}/custom2/"
__RESTART="${NEWDIR}/custom3/"
__NIGHTLIGHT="${NEWDIR}/custom4/"
__HTOP="${NEWDIR}/custom5/"

__NEWDIR="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding"

__TOTAL="['${__TERMINAL}', 
		  '${__BASH}', 
		  '${__SHUTDOWN}', 
		  '${__RESTART}', 
		  '${__NIGHTLIGHT}', 
		  '${__HTOP}']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${__TOTAL}"

#  ============  terminal  ============ 
gsettings set ${__NEWDIR}:${__TERMINAL} name 	'terminal'
gsettings set ${__NEWDIR}:${__TERMINAL} command 'gnome-terminal'
gsettings set ${__NEWDIR}:${__TERMINAL} binding '<Primary><Alt>t'

#  ============  bash  ============ 
gsettings set ${__NEWDIR}:${__BASH} name 	'bash'
gsettings set ${__NEWDIR}:${__BASH} command 'gnome-terminal -- bash'
gsettings set ${__NEWDIR}:${__BASH} binding '<Primary><Alt>b'

#  ============  shutdown  ============ 
gsettings set ${__NEWDIR}:${__SHUTDOWN} name 	'shutdown'
gsettings set ${__NEWDIR}:${__SHUTDOWN} command 'gnome-session-quit --force --power-off'
gsettings set ${__NEWDIR}:${__SHUTDOWN} binding '<Super>F4'

#  ============  restart  ============ 
gsettings set ${__NEWDIR}:${__RESTART} name    'restart'
gsettings set ${__NEWDIR}:${__RESTART} command 'gnome-session-quit --force --reboot'
gsettings set ${__NEWDIR}:${__RESTART} binding '<Super>F5'

#  ============  night light  ============ 
gsettings set ${__NEWDIR}:${__NIGHTLIGHT} name 	  'night light'
gsettings set ${__NEWDIR}:${__NIGHTLIGHT} command 'bash -c "if [[ $(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled) == "true" ]]; then gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false; else gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true; fi"'
gsettings set ${__NEWDIR}:${__NIGHTLIGHT} binding '<Alt><Super>n'

#  ============  htop  ============ 
gsettings set ${__NEWDIR}:${__HTOP} name 	'task manager'
gsettings set ${__NEWDIR}:${__HTOP} command 'gnome-terminal -- htop'
gsettings set ${__NEWDIR}:${__HTOP} binding '<Primary><Shift>Escape'
