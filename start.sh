#!/bin/bash
#FFMPEG安装脚本

#  版权所有（C）2007-2016 Sherin.co.in。 
#
#  此程序是免费软件; 您可以重新分发它和/或修改
#  根据发布的GNU通用公共许可证的条款
#  自由软件基金会; 版本2的许可证，或
#  （可选）任何更新的版本。
#
#  这个程序是分发的，希望它会有用，
#  但没有任何保证; 甚至没有隐含的保证
#  适销性或特定用途的适用性。 看到
#  GNU通用公共许可证了解更多详情。
#
#  您应该已经收到GNU通用公共许可证的副本
#  以及这个程序; 如果没有，写入自由软件
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
RED='\033[01;31m'
RESET='\033[0m'
INSTALL_SDIR='/usr/src/ffmpegscript'
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
export LD_LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/lib:/usr/local/lib:$LIBRARY_PATH
export CPATH=/usr/local/cpffmpeg/include:/usr/include/:usr/local/include:$CPATH
#presetup
sh presetup.sh

if [ -e "/etc/yum.conf" ];then
        echo "Ensuring required RPM ........"
        yum install bzip2 gcc gcc-c++ libgcc gd gd-devel gettext freetype \
        	freetype-devel ImageMagick ImageMagick-devel libjpeg* libjpeg-devel* \
        	libpng* libpng-devel* libstdc++* libstdc++-devel* libtiff* \
        	libtiff-devel* libtool*  libxml* libxml2* \
        	libxml2-devel* zlib* zlib-devel* automake* autoconf* samba-common* \
		ncurses-devel ncurses patch make apr-util giflib-devel giflib neon expat expat-devel alsa-lib -y
	rpm -e alsa-lib --nodeps
	export ARCH=$(arch)
fi

if [ -e "/etc/csf/csf.conf" ];then
	csf -x
fi


if [ -e "/etc/debian_version" ];then
	echo "Ensuring Debian packages ....."
	apt-get install bzip2 gcc libgd-dev gettext libfreetype6 libfreetype6-dev libpng-dev libstdc++-dev \
		libtiff-dev libtool libxml2 libxml2-dev automake autoconf libncurses-dev ncurses-dev patch \
		make git subversion -y
fi
#Git client
sh git.sh

if [ -e "/usr/bin/git" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Git client  installation Failed. Git is required for ffmpeg and mplayer . Please install it and run this script"$RESET
        echo " "
        echo " "
        exit
fi 

#Subversion client
mkdir -pv /usr/local/cpffmpeg/bin/
sh subversion.sh

if [ -e "/usr/local/cpffmpeg/bin/svn" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Svn  client  installation Failed.Svn  is required for mplayer . Please install it and run this script"$RESET
        echo " "
        echo " "
        exit
fi 




sh freetype.sh
sh libwmf.sh
sh ruby.sh
sh flvtool.sh
sh lame.sh
sh codecs.sh
sh libogg.sh
sh libvorbis.sh
sh vorbistools.sh
sh libtheora.sh
sh fdkaac.sh
sh voaacenc.sh
sh voamrwbenc.sh
sh libspeex.sh
sh libflac.sh
sh libao.sh
sh libvpx.sh
sh uriparser.sh
#sh libxspf.sh
sh liboggz.sh
#sh libfishsound.sh
sh yamdi.sh
sh amrnb.sh
sh amrwb.sh
sh libopencoreamr.sh
sh liba52.sh
sh facc.sh
sh faad2.sh
sh yasm.sh
sh nasm.sh
sh xvid.sh
sh x264.sh
sh x265.sh
sh re2c.sh
sh mplayer.sh
#if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
#        echo " "
#else
#        echo " "
#        echo " "
#        echo -e $RED"   Mplayer installation Failed :( ,  please contact  professional support sales@syslint.com"$RESET
#        echo " "
#        echo " "
#        exit
#fi
#
#ffmpeg
sh ffmpeg.sh
if [ -e "/usr/local/cpffmpeg/bin/ffmpeg" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   FFMPEG installation Failed :( ,  please contact  professional support sales@syslint.com"$RESET
        echo " "
        echo " "
        exit
fi

# preset 
sh preset.sh
#Rebuilding Mplayer
#sh mplayer.sh
#if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
#        echo " "
#else
#        echo " "
#        echo " "
#        echo -e $RED"   Mplayer installation Failed :( , please contact  professional support sales@syslint.com"$RESET
#        echo " "
#        echo " "
#        exit
#fi
#Mp4Boxh
sh mp4box.sh
#neroAacEnc
sh neroaacenc.sh
#mediainfo
sh mediainfo.sh
#post
sh post.sh

