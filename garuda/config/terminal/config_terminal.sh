HOME_DIR=$1

sudo make --directory config/terminal/cppneofetch/ install PREFIX=/usr

cp -vf config/terminal/config_files/.bashrc 	${HOME_DIR}
cp -vf config/terminal/config_files/config.fish ${HOME_DIR}/.config/fish/
