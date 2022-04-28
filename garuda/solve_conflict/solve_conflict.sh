#!/bin/bash

PACKAGES=$(/bin/cat solve_conflict/conflict_packages.txt)

for package in ${PACKAGES}; do
    exists=$(sudo pacman -Q ${package} --noconfirm 2>/dev/null)

    # if the $exists has value, $package will exist
    if [ "${exists}" == "" ]; then
        echo "${package} does not EXIST"
    else
        sudo pacman -R ${package} --noconfirm 2>/dev/null
    fi
done

# Fix keyring error
sudo pacman -Sy archlinux-keyring --noconfirm 2>/dev/null
sudo pacman -Sy chaotic-keyring --noconfirm 2>/dev/null
# sudo pacman-key --populate archlinux chaotic
# sudo pacman-key --refresh-keys
