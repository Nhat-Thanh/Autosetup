# todo: favorite apps on the dock
LAYOUT="[\
'firefox.desktop', \
'microsoft-edge.desktop', \
'org.gnome.Nautilus.desktop', \
'codeblocks.desktop', \
'org.qt-project.qtcreator.desktop', \
'steam.desktop', \
'com.teamviewer.TeamViewer.desktop', \
'teams.desktop'\
]"

gsettings set org.gnome.shell favorite-apps "$LAYOUT"


# todo: Setup app-folders
# IDs schemas
ID_TERMINAL='00617217-1326-43be-8159-3280a17dca85'
ID_TXT_EDITORS='06a53e1f-306f-4d8f-8fad-2932576e8d39'
ID_TOOLS='4742d7e6-8f3c-4b59-9dd1-11197b517733'
ID_QT='96149085-b165-4d86-a91f-a1730a004bca'
ID_GNOME_APPS='c535cade-b5a7-41f7-954f-036d2215be6d'
ID_OFFICES='630ec0e5-3434-4cb8-8c4b-d776289f065a'
ID_NETWORK='5712de45-ee0b-48e9-8204-cd29f15f692f'

IDs=(${ID_TERMINAL} ${ID_TXT_EDITORS} ${ID_TOOLS} ${ID_QT} ${ID_GNOME_APPS} ${ID_OFFICES} ${ID_NETWORK})


# Apps in app-folders
TERMINAL="[\
'Alacritty.desktop', \
'htop.desktop', \
'fish.desktop', \
'org.gnome.Terminal.desktop', \
'r.desktop'\
]"

TEXT_EDITORS="[\
'nvim.desktop', \
'nvim-qt.desktop', \
'visual-studio-code.desktop', \
'org.gnome.gedit.desktop'\
]"

TOOLS="[\
'garuda-system-maintenance-settings.desktop', \
'garuda-settings-manager.desktop', \
'jconsole-java-openjdk.desktop', \
'jshell-java-openjdk.desktop', \
'ar.com.softwareperonista.Pace.desktop', \
'reflector-simple.desktop', \
'stoken-gui.desktop', \
'stoken-gui-small.desktop', \
'btrfs-assistant.desktop'\
]"

QT="[\
'linguist.desktop', \
'assistant.desktop', \
'qdbusviewer.desktop', \
'designer.desktop', \
'qv4l2.desktop', \
'qvidcap.desktop'\
]"

GNOME_APPS="[\
'org.manjaro.pamac.manager.desktop', \
'org.gnome.eog.desktop', \
'org.gnome.Calculator.desktop', \
'org.gnome.Evince.desktop', \
'org.gnome.FileRoller.desktop', \
'org.gnome.Firmware.desktop', \
'org.gnome.Screenshot.desktop', \
'gnome-control-center.desktop', \
'gnome-system-monitor.desktop', \
'org.gnome.Settings.desktop'\
]"

OFFICES="[\
'libreoffice-writer.desktop', \
'libreoffice-calc.desktop', \
'libreoffice-impress.desktop', \
'libreoffice-draw.desktop', \
'libreoffice-base.desktop', \
'libreoffice-math.desktop', \
'libreoffice-startcenter.desktop'\
]"

NETWORK="[\
'bssh.desktop', \
'nm-connection-editor.desktop', \
'bvnc.desktop', \
'avahi-discover.desktop'\
]"

APPs=("$TERMINAL" "$TEXT_EDITORS" "$TOOLS" "$QT" "$GNOME_APPS" "$OFFICES" "$NETWORK")


# Names of app-folders
NAMEs=("Terminal" "Text Editors" "Tools" "Qt" "Gnome Apps" "Offices" "Network")

# todo: set value for "org.gnome.desktop.app-folders.folder-children"
VALUE="'${IDs[0]}'"
for ID in ${IDs[*]:1:7}; do
    VALUE="$VALUE, '${ID}'"
    gsettings set org.gnome.desktop.app-folders folder-children "[$VALUE]"
done

# todo: clutter apps in to folders
idx=0
while ((idx < 7)); do
    # gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${IDs[$idx]}/ apps "${APPs[$idx]}"
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${IDs[$idx]}/ apps "${APPs[$idx]}"
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${IDs[$idx]}/ name "'${NAMEs[$idx]}'"
    ((idx += 1))
done


# todo: setup app-picker-layout
LAYOUT="[\
{\
'06a53e1f-306f-4d8f-8fad-2932576e8d39': <{'position': <0>}>, \
'96149085-b165-4d86-a91f-a1730a004bca': <{'position': <1>}>, \
'630ec0e5-3434-4cb8-8c4b-d776289f065a': <{'position': <2>}>, 
'gparted.desktop': <{'position': <3>}>, \
'org.gnome.DiskUtility.desktop': <{'position': <4>}>, \
'cmake-gui.desktop': <{'position': <5>}>, \
'org.gnome.Extensions.desktop': <{'position': <6>}>, \
'ca.desrt.dconf-editor.desktop': <{'position': <7>}>, \
'wihotspot.desktop': <{'position': <8>}>, \
'vlc.desktop': <{'position': <9>}>, \
'org.gnome.tweaks.desktop': <{'position': <10>}>\
}, \
{\
'c535cade-b5a7-41f7-954f-036d2215be6d': <{'position': <0>}>, \
'5712de45-ee0b-48e9-8204-cd29f15f692f': <{'position': <1>}>, \
'00617217-1326-43be-8159-3280a17dca85': <{'position': <2>}>, \
'4742d7e6-8f3c-4b59-9dd1-11197b517733': <{'position': <3>}>\
}\
]"

gsettings set org.gnome.shell app-picker-layout "$LAYOUT"

# todo: set input source
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo::Us')]"

# change to dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
