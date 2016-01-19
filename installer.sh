#!/bin/bash
# Installs wl driver for wireless chipset b43xx from the bcmwl-kernel-source.deb
# Useage: ./installer.sh

CHKROOT="$(whoami)"

if [ "$CHKROOT" != "root" ]; then
    echo "Must be root... {sudo ./installer.sh}"
    exit
    else
    sudo dpkg -i bcmwl-kernel-source.deb
fi

if [ $? = "0" ]; then
    echo="module compiled...installing wl..."
    sudo modprobe -r ssb wl brcmfmac brcmsmac bcma
    sudo modprobe wl
        if [ $? = "0" ]; then
	    echo "wl driver installed..."
	    else
	    echo "Installation failed...exiting"
	exit 1
	fi

fi
