#!/bin/bash
#
#   $$SH2NAME$$ Version 2.00.0
#   $$DATE$$
#
#   Adapted from the Bod Installation Script: Bodhi 2.0 i686
#
#   Bodhi Linux (c) 2012
#   Original Authors : rbt y-lee, Jeff Hoogland
#   Adapted by : hippytaff
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

BOD_NAME="Offline b43xx Module"
APP_NAME="bcmwl-kernel-source"
APP_DESC="Offline installation of wl module for b43xx broadcom wireless chipset"
PKG_LIST="bcmwl-kernel-source"
MENU_STR="$$APPINSTR$$"

rmAptCache(){
    sudo rm -rf /var/lib/apt/lists/*
    sudo mkdir /var/lib/apt/lists/partial
    sudo rm -rf /var/cache/apt/archives/*
    sudo mkdir /var/cache/apt/archives/partial
}

copyAptCache(){
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    sudo cp sources.list /etc/apt/
    sudo cp -f lists/* /var/lib/apt/lists/
    sudo cp *.deb /var/cache/apt/archives/ 2>/dev/null
}

assert_package() {
    is_installed=$(apt-cache policy $APP_NAME | grep 'Installed: (none)' | wc -l)
    if [ "$is_installed" -eq "1" ]; then
        echo "Installation Failure!!"
    else
        echo "${BOD_NAME^} Installed"
        apt-cache policy $APP_NAME
    fi
}

load_mod() {
    sudo modprobe -r ssb wl brcmfmac brcmsmac bcma
    sudo modprobe wl
}

rmAptCache

if [ "$1" == debug ]; then
    echo "Moving data into apt cache"
    copyAptCache
    echo "Installing $APP_NAME via apt..."
    sudo apt-get -y --force-yes --no-download --ignore-missing install $PKG_LIST 2>/dev/null
    assert_package
    rmAptCache
    sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list
    sudo rm /etc/apt/sources.list.bak
    if [ "$2" == update ]; then
       sudo apt-get update
    fi
    exit $is_installed
fi

copyAptCache
sudo apt-get -y --force-yes --no-download --ignore-missing install $PKG_LIST 2>/dev/null
echo "Installing ${BOD_NAME^}"
load_mod
assert_package
rmAptCache
sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list
sudo rm /etc/apt/sources.list.bak
if [ "$1" == update ]; then
    sudo apt-get update
fi
echo -e "\n${BOD_NAME^} $APP_DESC installation completed.\n"
exit $is_installed

# All Wrongs Reserved.
