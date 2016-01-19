# b43xxofline
Offline installation of bcmwl-kernel-source for wireless chipset(s) b43xx.

Install using ./installer.sh
- $>chmod +x installer.sh
- $>./installer.sh

Manual installation:
- $>sudo dpkg -i bcmwl-kernel-source.deb 

To load the wl module
- $>sudo modprobe -r ssb -wl -brcmfmac -brcmsmac -bcma
- $>sudo modprobe wl

Wireless networks should now be available.

NB - this is for 32bit architecture. I will add 64bit in due course, eventhough I don't need it (Yet!)

