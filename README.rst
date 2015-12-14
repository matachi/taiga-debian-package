====================
Taiga Debian package
====================

Install dependencies::

    $ sudo apt-get update
    $ sudo apt-get install build-essential fakeroot devscripts debhelper

Check for missing build dependencies::

    $ dpkg-checkbuilddeps

Build the package::

    $ dpkg-buildpackage -b

Install::

    $ sudo dpkg -i ../taiga_1.0.0-1_amd64.deb

Install missing dependencies::

    $ sudo apt-get -yf install

Rebuild package without cleaning::

    $ dpkg-buildpackage -b -nc

