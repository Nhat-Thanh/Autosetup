PACKAGES=$(/bin/cat remove_packages/redundant_packages.txt)

for package in ${PACKAGES}; do
    exists=$(sudo pacman -Q ${package} --noconfirm 2>/dev/null)

    # if the $exists has value, $package existed
    if [ "${exists}" == "" ]; then
        echo "${package} does not EXIST"
    else
        sudo pacman -R ${package} --noconfirm 2>/dev/null
    fi
done
