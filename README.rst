====================
Taiga Debian package
====================

How to build package::

    $ dpkg-buildpackage -b

How to install::

    $ sudo dpkg -i ../taiga_1.0.0-1_amd64.deb

Install missing dependencies::

    $ sudo apt-get -yf install

Rebuild package without cleaning::

    $ dpkg-buildpackage -b -nc

