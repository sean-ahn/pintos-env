# CS330 - Operating System Environment setting
# Minsu Kim, 2018

# -- Resources --
# pintos-base http://www.stanford.edu/class/cs140/projects/pintos/pintos.tar.gz
# bochs-2.2.6 https://jaist.dl.sourceforge.net/project/bochs/bochs/2.2.6/bochs-2.2.6.tar.gz
# gcc-4.1 http://csl.skku.edu/SWE3004S13/SSEGCC

# -- Usage --
# $ sudo ./install.sh
# HOWEVER, I recommend to follow step by step, manually.

# 0. Ensure repo updated&gcc installed
## apt-get update
apt-get install -y g++

# 1. gcc-4.1 install
cd $HOME
wget http://cps.kaist.ac.kr/courses/gcc4/sse-gcc-installer-v3
chmod +x sse-gcc-installer-v3
./sse-gcc-installer-v3

# make gcc-4.1 available
ln -s /usr/local/bin/sse-gcc /usr/local/bin/gcc-4.1
ln -s /usr/local/bin/sse-g++ /usr/local/bin/g++-4.1

# 2. download bochs&pintos
wget https://jaist.dl.sourceforge.net/project/bochs/bochs/2.2.6/bochs-2.2.6.tar.gz
wget http://cps.kaist.ac.kr/courses/2018_spring_cs330/sources/pintos.tar.gz
tar xvf pintos.tar.gz

# 3. install bochs

# dependency: ncurses
sudo apt-get install -y libncurses-dev

# build bochs and install
cd $HOME/pintos/src/misc
sudo env SRCDIR=$HOME PINTOSDIR=$HOME/pintos DSTDIR=/usr/local CC=gcc-4.1 CXX=g++-4.1 ./bochs-2.2.6-build.sh

# 4. install qemu
apt-get install -y qemu
ln -s /usr/bin/qemu-system-x86_64 /usr/bin/qemu

# 5. make utils
cd $HOME/pintos/src/utils
make

# add pintos to PATH
echo 'export PATH=$PATH:~/pintos/src/utils/' >> $HOME/.bashrc
