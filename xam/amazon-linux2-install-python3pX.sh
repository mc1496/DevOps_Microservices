#!/usr/bin/bash
#https://www.python.org/downloads/source/
# https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tar.xz
# https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tar.xz
# https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
# https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tar.xz

if [[ $1 = 8 ]];then
    V=3.8.16
elif [[ $1 = 9 ]];then
    V=3.9.16
elif [[ $1 = 10 ]];then
    V=3.10.9
elif [[ $1 = 11 ]];then
    V=3.11.1
elif [[ -z $1 ]];then
    echo "This script needs one mandatory arg"
    echo "Valid valuse are X=8,9,10,11 to install Python 3.X"
    exit 1
else
    echo "Invalid arg-value"
    echo "Valid valuse are X=8,9,10,11 to install Python 3.X"
    exit 2
fi
P="Python-$V"
XZ="Python-$V.tar.xz"
URL="https://www.python.org/ftp/python/$V/$XZ"
echo -e "installing $P from \n$URL"

cd /home/ec2-user/environment
sudo yum -y install openssl-devel bzip2-devel libffi-devel wget


wget "$URL"
tar xvf "$XZ"

cd "$P/"
./configure --enable-optimizations
sudo make altinstall

python3."$1" --version
python3."$1" -m pip install --upgrade pip

pip3."$1" --version

#clean up
cd ..
rm "$XZ"
sudo rm -rf "$P"

echo "use python3.X -m venv env"
#NOTE: voclabs:~/environment $ ls -al /usr/bin/python*
#lrwxrwxrwx 1 root root   16 Dec 13 12:44 /usr/bin/python3-config -> python3.7-config
#lrwxrwxrwx 1 root root    9 Dec 13 12:36 /usr/bin/python3 -> python3.7