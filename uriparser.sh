#!/bin/bash
#FFMPEG installation script

#  Copyright (C) 2007-2014 Sherin.co.in. All rights reserved.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
RED='\033[01;31m'
RESET='\033[0m'
INSTALL_SDIR='/usr/src/ffmpegscript'
_url=`cat ./url.txt`
SOURCE_URL=$_url/uriparser
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
_package='uriparser-0.8.0.tar.bz2'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf uriparser*

yum -y install doxygen graphviz-devel graphviz expat expat-devel
wget -c $SOURCE_URL/$_package
#mv /root/ffmpeginstaller/source/uriparser/$_package $INSTALL_SDIR
tar -xvjf $_package
cd uriparser-0.8.0/
./configure  --prefix=/usr/local/cpffmpeg --disable-test
make 
make install
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
