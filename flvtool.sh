#!/bin/bash
#FFMPEG安装脚本

#  版权所有（C）2007-2014 Sherin.co.in。
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
_url=`cat ./url.txt`
_ffinstal='/ffmpeginstaller'
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
_package='flvtool2-1.0.6.tgz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
flvtool_source=$_package
#install flvtool
ldconfig
echo "removing old source"
cd $_ffinstal/
   #rm -vrf flvtool*
if [ -f "$_package" ]
	then
		echo "$_package found, Skip Downloads"
else
		echo "$_package not found, Try Downloading......"
		wget $_url/$_package
fi
   tar -zxvf  $_package
   cd flvtool2-1.0.6/
   /usr/local/cpffmpeg/bin/ruby setup.rb config
   /usr/local/cpffmpeg/bin/ruby setup.rb setup
   /usr/local/cpffmpeg/bin/ruby setup.rb install
   ln -s /usr/local/cpffmpeg/bin/flvtool2 /usr/local/bin/flvtool2
   ln -s /usr/local/cpffmpeg/bin/flvtool2 /usr/bin/flvtool2

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
