HOME_DIR=$1
EXTENSIONS=$(cat config/vscode/extensions.txt)

for ext in ${EXTENSIONS[*]}; do
    code --install-extension ${ext}
    # echo ${ext}
done

mkdir -p ${HOME_DIR}/.vscode
cp -vf config/vscode/settings.json ${HOME_DIR}/.config/Code/User/
cp -vf config/vscode/settings.json ${HOME_DIR}/.vscode
