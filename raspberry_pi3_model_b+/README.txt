##############################	
#	Name: Jack.Lai
#	Data: 2022/05/14
##############################

##############################	
#	Docker RUN
##############################

$ docker ps
$ docker search ubuntu -f is-official=true
$ docker pull ubuntu
$ docker images
$ docker run ubuntu	
$ docker stop ubuntu
	
https://ithelp.ithome.com.tw/articles/10190921

##############################	
#	Run By DockerFile
##############################

$ vim dockerfile
$ docker build . -t jack
$ docker run --restart=always -d -it --mount type=bind,source="$(pwd)"/yocto,target=/app  -p 8022:22 jack
$ docker ps
$ docker exec -it <ContainerID> "/bin/bash"
$ docker stop <ContainerID>

https://ithelp.ithome.com.tw/articles/10200216
https://stackoverflow.com/questions/30172605/how-do-i-get-into-a-docker-containers-shell

########################################
#	Building Up Yocto Enviroment       
########################################

git clone -b dunfell git://git.yoctoproject.org/poky.git
mkdir sources
cd sources
git clone -b dunfell git://git.openembedded.org/meta-openembedded
git clone -b dunfell https://github.com/agherzan/meta-raspberrypi.git
git clone -b dunfell https://github.com/meta-qt5/meta-qt5
git clone -b dunfell git://git.yoctoproject.org/meta-security.git
cd ..

source poky/oe-init-build-env rpi-build

bitbake-layers add-layer ../sources/meta-raspberrypi 
bitbake-layers add-layer ../sources/meta-openembedded/
bitbake-layers add-layer ../sources/meta-openembedded/meta-oe/
bitbake-layers add-layer ../sources/meta-openembedded/meta-python/
bitbake-layers add-layer ../sources/meta-openembedded/meta-networking/
bitbake-layers add-layer ../sources/meta-openembedded/meta-multimedia/
bitbake-layers add-layer ../sources/meta-openembedded/meta-perl/
bitbake-layers add-layer ../sources/meta-qt5
bitbake-layers add-layer ../sources/meta-security

bitbake core-image-base  

[1] meta-raspberrypi
https://github.com/agherzan/meta-raspberrypi
https://readthedocs.org/projects/meta-raspberrypi/downloads/pdf/latest/  

[2] Yocto Project Quick Start
https://docs.yoctoproject.org/   
https://www.yoctoproject.org/docs/1.5/yocto-project-qs/yocto-project-qs.html   

[3] Other guide
https://blog.csdn.net/zzs0829/article/details/109708216
https://gachiemchiep.github.io/cheatsheet/build_image_rpi3_yocto/

#################################
#	Get&Use Cross Compiler        
#################################

bitbake core-image-base -c populate_sdk

./poky-glibc-x86_64-core-image-base-cortexa7t2hf-neon-vfpv4-raspberrypi3-toolchain-3.1.9.sh

echo /home/jack/rpi_yocto/sdk

. environment-setup-cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi

[1] Raspberry Pi Basic #003 : SDK Build and Test
https://www.youtube.com/watch?v=YKQTYvqdcA8

########################################
#	Programing Image to SDCARD         
########################################

sudo fdisk -l

dd if=/dev/zero of=/dev/sdb

sudo fdisk /dev/sdb 

sudo apt-get install bmap-tools

sudo bmaptool copy core-image-base-raspberrypi3.wic.bz2 /dev/sdb

###########################################
# 	Building Up Yocto Enviroment       
###########################################

bitbake-layers show-recipes
bitbake-layers show-layers
bitbake-layers remove-layer ../sources/meta-jumpnow

############################################
#	Devtool for modify the source code
############################################

devtool reset tf-a-stm32mp

devtool modify tf-a-stm32mp

git status
git add .
git commit -m "update content message"

devtool build tf-a-stm32mp
devtool finish tf-a-stm32mp meta-st-stm32mp

reference:
https://wiki.phytec.com/pages/viewpage.action?pageId=127338558

#############################
#	Bitbake Command					
#############################

bitbake <package> -c listtasks

bitbake <package> -c <task>

bitbake virtual/kernel -c menuconfig

reference:
https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/Useful-bitbake-commands/ta-p/1128559

#############################
#	Patch file 					
#############################

git init

git status 

git format-patch --root

git am .

refernece:
https://ithelp.ithome.com.tw/articles/10188265

#############################
#	NTFS introduction						
#############################

https://www.ntfs.com/index.html

http://ntfs.com/ntfs_basics.htm



    




