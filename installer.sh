 #!/bin/bash
#
#   $$SHNAME$$ Version 2.00.0
#   $$DATE$$
#
#   Bod Installation Script: Bodhi 2.0 i686
#
#   Bodhi Linux (c) 2012
#   Authors : rbt y-lee, Jeff Hoogland
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

BOD_NAME="b43xxinstaller"
APP_NAME="bcmwl-kernel-soource"
APP_DESC="Offline installation of wifi module for b43xx wifi chipsets"


echo -e "\nBodhi Application Installer\n      ${BOD_NAME^}: $APP_DESC\n"

ARCH=`cat /proc/cpuinfo | grep ARM`

if [ -n "$ARCH" ]; then
  echo "FATAL ERROR: ARM Processor detected."

  echo "Sorry, this installer does not support\nthe cpu architecure detected."
  echo "aborting installation ..."
  exit 1
fi

CPU_B=`/bin/uname -m | grep i686`
if [ -z "$CPU_B" ]; then
  echo "FATAL ERROR: Cpu not supported"
  echo "aborting installation ..."
  exit 1
fi

echo "Would you like to install ${BOD_NAME^}: $APP_DESC?"

if [ $? == 1 ]; then
    echo -e "${BOD_NAME^} installation aborted.\n"
    exit 1
fi

echo "Please enter your password to install $BOD_NAME"

DO="./bodapt.sh $@"
echo "Please enter your password to perform administrative tasks:" sudo -S sudo $DO
exit $?

# All Wrongs Reserved.
