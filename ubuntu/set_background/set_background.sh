HOME_DIR=$1

# BG - BACKGROUNG
BG_NAME="background.png"

BG_FILE="set_background/${BG_NAME}"
BG_PATH="${HOME_DIR}/.local/share/${BG_NAME}"

cp -f ${BG_FILE} ${BG_PATH}

gsettings set org.gnome.desktop.background picture-uri "file:///${BG_PATH}"
