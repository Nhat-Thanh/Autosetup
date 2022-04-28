#!/bin/bash

PACKAGES=$(/bin/cat solve_conflict/prepared_packages.txt)

for package in ${PACKAGES}; do
    exists=$(sudo pacman -Q ${package} --noconfirm 2>/dev/null)

    # if the $exists has value, $package will exist
    if [ "${exists}" == "" ]; then
        sudo pacman -S ${package} --noconfirm 2>/dev/null
    else
        echo "${package} has already EXISTED"
    fi
done