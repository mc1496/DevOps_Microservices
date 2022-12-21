#!/usr/bin/bash
cd /home/ec2-user/environment
sudo yum -y install openssl-devel bzip2-devel libffi-devel wget

#https://www.python.org/downloads/source/
wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
tar xvf Python-3.9.16.tar.xz

cd Python-*/
./configure --enable-optimizations
sudo make altinstall

python3.9 --version
python3.9 -m pip install --upgrade pip

pip3.9 --version
#clean up
rm Python-3.9.16.tar.xz

echo "use python3.9 -m venv env"
#NOTE: voclabs:~/environment $ ls -al /usr/bin/python*
#lrwxrwxrwx 1 root root   16 Dec 13 12:44 /usr/bin/python3-config -> python3.7-config
#lrwxrwxrwx 1 root root    9 Dec 13 12:36 /usr/bin/python3 -> python3.7