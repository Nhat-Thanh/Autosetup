# EXTENSIONS=$(cat extensions/extensions.txt)
EXTENSIONS=$(/bin/ls extensions/extensions)

for extension in ${EXTENSIONS[*]}; do
    # echo "$extension"
    gnome-extensions enable "$extension"
done
