PACKAGES=$(cat install_packages/required_packages.txt)

for package in ${PACKAGES}; do
    exists=$(sudo dpkg-query -s ${package} 2>/dev/null)
    
    # if the $exists has value, $package will exist
    if [ "${exists}" == "" ]; then
        sudo apt install ${package} -y 2>/dev/null
    else
        echo "${package} has already installed"
    fi
done

sudo apt install ./install_packages/deb/* -y 2>/dev/null

