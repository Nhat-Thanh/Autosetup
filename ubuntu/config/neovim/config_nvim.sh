HOME_DIR=$1

sh -c "curl -fLo $HOME_DIR/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

cp -rf config/neovim/nvim/ $HOME_DIR/.config/

pip install jedi
pip install pynvim

nvim -c 'PlugInstall' 										\
	 -c 'CocInstall coc-clang coc-sh coc-python coc-java' 	\
	 -c 'qa'
