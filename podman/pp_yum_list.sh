
yum install make -y
yum install less -y

yum install vim -y
yum install gcc -y
yum install gcc-c++ -y
yum install gcc-gfortran -y
yum install readline-devel -y
yum install libX11-devel libXt-devel -y
yum install zlib-devel -y
yum install bzip2-devel -y
yum install xz-devel -y
yum install pcre2-devel -y
yum install libcurl-devel -y
yum install java-devel -y

yum install wget -y
yum install openssl-devel -y
yum install libpng-devel -y
yum install epel-release -y
yum install python-devel  python-pip -y
yum install python3-devel python3-pip -y
yum install fontconfig-devel -y
yum install libxml2-devel -y
yum install harfbuzz-devel fribidi-devel -y
yum install freetype-devel libpng-devel libtiff-devel libjpeg-devel -y
yum install pango-devel -y

yum install gsl-devel -y

yum install centos-release-scl -y
yum install devtoolset-9 -y

scl enable devtoolset-9 -- bash
#~/.R/Makevars
#CXX17 = g++ -std=gnu++17 -fPIC




