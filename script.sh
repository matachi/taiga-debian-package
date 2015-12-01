#!/usr/bin/env bash

mkdir ~/taiga-debian-pkg
pushd ~/taiga-debian-pkg
wget https://github.com/taigaio/taiga-front-dist/archive/master.tar.gz
mv master.tar.gz taiga-front-dist-1.0.0.tar.gz
tar -xvzf taiga-front-dist-1.0.0.tar.gz
mv taiga-front-dist-master taiga-front-dist-1.0.0
cd taiga-front-dist-1.0.0
dh_make -f ../taiga-front-dist-1.0.0.tar.gz -s
popd
