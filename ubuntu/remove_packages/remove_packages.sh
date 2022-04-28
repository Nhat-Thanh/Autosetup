PACKAGES=$(cat remove_packages/unneeded_packages.txt)

for package in ${PACKAGES}; do
    exists=$(sudo dpkg-query -s ${package} 2>/dev/null)

    # if the $exists has value, $package will exist
    if [ "${exists}" == "" ]; then
        echo "${package} does not EXIST"
    else
        sudo apt remove ${package} -y 2>/dev/null
    fi
done
