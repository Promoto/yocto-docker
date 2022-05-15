#
FROM ubuntu:18.04

#
ENV TZ=Etc/UTC
ENV DEBIAN_FRONTEND=noninteractive

# Commom Package
RUN apt update 
RUN apt install tzdata libncursesw5-dev repo libsdl1.2-dev -y 
RUN apt install nfs-common nfs-kernel-server -y
RUN apt install build-essential vim unzip net-tools -y
RUN apt install sed wget curl cvs subversion git coreutils -y
RUN apt install texi2html texinfo docbook-utils gawk -y 
RUN apt install python-pysqlite2 diffstat help2man -y
RUN apt install make gcc g++ desktop-file-utils chrpath -y 
RUN apt install libxml2-utils xmlto docbook bsdmainutils -y 
RUN apt install iputils-ping cpio python-wand -y
RUN apt install python-pycryptopp python-crypto xterm corkscrew  -y
RUN apt install device-tree-compiler mercurial u-boot-tools libarchive-zip-perl -y 
RUN apt install ncurses-dev bc linux-headers-generic gcc-multilib libncurses5-dev -y
RUN apt install lrzsz dos2unix lib32ncurses5 libssl-dev -y

# Set The Locale
RUN apt install locales
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# SSH-SERVER: https://bingdoal.github.io/deploy/2021/02/use-ssh-connect-on-docker-container/
RUN apt install openssh-server -y
RUN echo "root:root" | chpasswd
RUN echo "Port 22" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

CMD /etc/init.d/ssh restart

#
SHELL ["/bin/bash", "-c"]