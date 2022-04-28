HOME_DIR=$1

sudo make --directory config/terminal/cppneofetch/ install PREFIX=/usr

cp -vf config/terminal/config_files/.bashrc $HOME_DIR

rm -rf $HOME_DIR/.config/fish
mkdir -p $HOME_DIR/.config/fish
cp -vf config/terminal/config_files/config.fish $HOME_DIR/.config/fish

gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false
