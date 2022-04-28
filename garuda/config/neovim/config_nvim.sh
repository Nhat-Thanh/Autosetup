HOME_DIR=$1

sh -c "curl -fLo ${HOME_DIR}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

cp -rf config/neovim/nvim/ ${HOME_DIR}/.config/

pip install jedi
pip install pynvim

# see coc-lsp: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions

nvim -c 'PlugInstall | qa'
# nvim -c "CocInstall coc-clangd coc-sh coc-pyright coc-java coc-html" -c "qa"
# nvim -c "VimspectorInstall vscode-cpptools vscode-bash-debug debugpy vscode-java-debug" -c "qa"

