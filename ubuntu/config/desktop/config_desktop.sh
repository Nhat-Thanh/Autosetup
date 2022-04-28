# todo: favorite apps on dock
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
ID_TERMINAL='6252eb83-6072-48fb-958a-ad576c3d529d'
ID_TXT_EDITORS='b3e75445-a8e1-40a2-8ae8-14faaa1acf37'
ID_TOOLS='028dd9e0-9bcf-46c6-9b80-0ec50387158c'
ID_QT='9558d520-9964-4c7c-af69-b972c567a3c5'
ID_GNOME_APPS='9a9ac96c-08a2-434b-8b0f-96758be89bb6'
ID_OFFICES='04cb9553-2b2c-4ad7-bbcf-39b84f340239'

IDs=(${ID_TERMINAL} ${ID_TXT_EDITORS} ${ID_TOOLS} ${ID_QT} ${ID_GNOME_APPS} ${ID_OFFICES})


# apps in app-folders
APPS_TERMINAL="[\
'org.gnome.Terminal.desktop', \
'debian-uxterm.desktop', \
'debian-xterm.desktop', \
'htop.desktop'\
]"

APPS_TXT_EDITORS="[\
'code.desktop', \
'vim.desktop', \
'nvim.desktop', \
'nvim-qt.desktop', \
'org.gnome.gedit.desktop'\
]"

APPS_TOOLS="[\
'gnome-language-selector.desktop', \
'yelp.desktop', 'org.gnome.Characters.desktop', \
'org.gnome.Logs.desktop', \
'snap-store_ubuntu-software.desktop', \
'gnome-session-properties.desktop'\
]"

APPS_QT="[\
'org.qt-project.qtcreator.desktop', \
'assistant-qt5.desktop', \
'linguist-qt5.desktop', \
'designer-qt5.desktop'\
]"

APPS_GNOME_APPS="[\
'org.gnome.FileRoller.desktop', \
'org.gnome.Calculator.desktop', \
'org.gnome.Evince.desktop', \
'org.gnome.Nautilus.desktop', \
'org.gnome.eog.desktop', \
'gnome-control-center.desktop', \
'gnome-system-monitor.desktop', \
'org.gnome.Screenshot.desktop'\
]"

APPS_OFFICES="[\
'libreoffice-calc.desktop', \
'libreoffice-writer.desktop', \
'libreoffice-base.desktop', \
'libreoffice-draw.desktop', \
'libreoffice-impress.desktop'\
]"

APPs=("$APPS_TERMINAL" "$APPS_TXT_EDITORS" "$APPS_TOOLS" "$APPS_QT" "$APPS_GNOME_APPS" "$APPS_OFFICES")


# Names of app-folders
NAMEs=("Terminal" "Text Editors" "Tools" "Qt" "Gnome Apps" "Offices")

# todo: set value for "org.gnome.desktop.app-folders.folder-children"
VALUE="'${IDs[0]}'"
for ID in ${IDs[*]:1:6}; do
    VALUE="$VALUE, '${ID}'"
    gsettings set org.gnome.desktop.app-folders folder-children "[$VALUE]"
done

# todo: clutter apps in to folders
idx=0
while ((idx < 6)); do
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${IDs[$idx]}/ apps "${APPs[$idx]}"
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${IDs[$idx]}/ apps "${APPs[$idx]}"
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${IDs[$idx]}/ name "'${NAMEs[$idx]}'"
    ((idx += 1))
done


# todo: setup app-picker-layout
# LAYOUT="[\
# {\
# 'b3e75445-a8e1-40a2-8ae8-14faaa1acf37': <{'position': <0>}>, \
# '9558d520-9964-4c7c-af69-b972c567a3c5': <{'position': <1>}>, \
# '04cb9553-2b2c-4ad7-bbcf-39b84f340239': <{'position': <2>}>, 
# 'gparted.desktop': <{'position': <3>}>, \
# 'org.gnome.DiskUtility.desktop': <{'position': <4>}>, \
# 'cmake-gui.desktop': <{'position': <5>}>, \
# 'org.gnome.Extensions.desktop': <{'position': <6>}>, \
# 'ca.desrt.dconf-editor.desktop': <{'position': <7>}>, \
# 'wihotspot.desktop': <{'position': <8>}>, \
# 'vlc.desktop': <{'position': <9>}>, \
# 'org.gnome.tweaks.desktop': <{'position': <10>}>\
# }, \
# {\
# '9a9ac96c-08a2-434b-8b0f-96758be89bb6': <{'position': <0>}>, \
# '5712de45-ee0b-48e9-8204-cd29f15f692f': <{'position': <1>}>, \
# '6252eb83-6072-48fb-958a-ad576c3d529d': <{'position': <2>}>, \
# '028dd9e0-9bcf-46c6-9b80-0ec50387158c': <{'position': <3>}>\
# }\
# ]"
# gsettings set org.gnome.shell app-picker-layout "$LAYOUT"

# todo: set input source
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo::Us')]"

# todo: disable redundant extensions
gsettings set org.gnome.shell disabled-extensions "['ubuntu-appindicators@ubuntu.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'desktop-icons@csoriano', 'ubuntu-dock@ubuntu.com']"
