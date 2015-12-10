#!/bin/bash

yum install -y readline hg
wget https://pypi.python.org/packages/2.7/P/Pygments/Pygments-1.6-py2.7.egg#md5=1e1e52b1e434502682aab08938163034 --no-check-certificate
wget https://bootstrap.pypa.io/ez_setup.py -O - --no-check-certificate | python
easy_install Pygments-1.6-py2.7.egg
easy_install prettytable
wget http://peak.telecommunity.com/dist/ez_setup.py
python ez_setup.py 
easy_install pip
pip install --upgrade setuptools
pip install --upgrade pip
pip install --upgrade prettytable
pip install --upgrade Pygments
pip install --upgrade cloudmonkey

cloudmonkey_path=`find /usr/lib -name site-packages`

rm -rf ez* Py* set* 2>/dev/null

yum remove -y python-pip
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python get-pip.py

cloudmonkey quit
rm *.py 2>/dev/null
