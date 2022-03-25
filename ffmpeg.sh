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
SOURCE_URL=$_url/ffmpeg
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
_package='FFMPEG'
clear
sleep 2
ffmpeg_source=$_package
ldconfig
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR
echo "Removing old source"
   rm -vrf ffmpeg*
   #wget $SOURCE_URL/$ffmpeg_source
   #tar -xvzf $ffmpeg_source
#	git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
#   cd ffmpeg/
#wget http://ffmpeg.org/releases/ffmpeg-3.1.tar.gz
wget $SOURCE_URL/ffmpeg-3.1.tar.gz
#mv /root/ffmpeginstaller/source/ffmpeg/ffmpeg-3.1.tar.gz $INSTALL_SDIR
tar -xvzf ffmpeg-3.1.tar.gz
cd ffmpeg-3.1
   ldconfig
./configure --prefix=$INSTALL_DDIR --enable-shared --enable-nonfree \
		--enable-gpl --enable-pthreads --enable-libfreetype  --enable-libopencore-amrnb  --enable-decoder=liba52 \
		--enable-libopencore-amrwb  --enable-libfaac  --enable-libmp3lame \
		--enable-libtheora --enable-libvorbis  --enable-libx264  --enable-libxvid \
		--extra-cflags=-I/usr/local/cpffmpeg/include/ --extra-ldflags=-L/usr/local/cpffmpeg/lib \
		 --enable-version3 --extra-version=syslint
   make -j$cpu
   make tools/qt-faststart   
   make install
   cp -vf tools/qt-faststart /usr/local/cpffmpeg/bin/
   ln -sf /usr/local/cpffmpeg/bin/ffmpeg /usr/local/bin/ffmpeg
   ln -sf /usr/local/cpffmpeg/bin/ffmpeg /usr/bin/ffmpeg
   ln -sf /usr/local/cpffmpeg/bin/qt-faststart /usr/local/bin/qt-faststart
   ln -sf /usr/local/cpffmpeg/bin/qt-faststart /usr/bin/qt-faststart
   ldconfig
   /usr/bin/ffmpeg -formats

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
