
git clone -b dunfell git://git.yoctoproject.org/poky.git

mkdir sources
cd ./sources
git clone -b dunfell git://git.openembedded.org/meta-openembedded
git clone -b dunfell https://github.com/agherzan/meta-raspberrypi.git
git clone -b dunfell https://github.com/meta-qt5/meta-qt5
git clone -b dunfell git://git.yoctoproject.org/meta-security.git

cd ../poky
source ./oe-init-build-env ../rpi-build

bitbake-layers add-layer ../sources/meta-raspberrypi/ 
bitbake-layers add-layer ../sources/meta-openembedded/meta-oe/
bitbake-layers add-layer ../sources/meta-openembedded/meta-python/
bitbake-layers add-layer ../sources/meta-openembedded/meta-networking/
bitbake-layers add-layer ../sources/meta-openembedded/meta-multimedia/
bitbake-layers add-layer ../sources/meta-openembedded/meta-perl/
bitbake-layers add-layer ../sources/meta-qt5
bitbake-layers add-layer ../sources/meta-security

cp ../local.conf  ./conf/

sed -i 's/INHERIT/#INHERIT/1' ../poky/meta/conf/sanity.conf

bitbake core-image-base 

mkdir ../sdk