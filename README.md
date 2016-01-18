# b43xxofline
Deb file for offline installation of bcmwl-kernel-source for wireless chipset(s) b43xx.
It's here for easy accsess to transfer from an internet enavled device to a device that
needs the driver but does not have access to the internet (ie via ethernet) in order to
download and install it the normal way.

To installing this .deb should be as easy as opening a terminal (in the same directory as
the .deb file) and doing:

$>sudo dpkg -i bcmwl-kernel-source.deb 

To load the wl module

$>sudo modprobe -r ssb -wl -brcmfmac -brcmsmac -bcma
$>sudo modprobe wl

Wireless networks should now be available.

NB - this is for 32bit architecture. I will add 64bit in due course, eventhough I don't need it (Yet!)

