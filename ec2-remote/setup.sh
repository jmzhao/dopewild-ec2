#!/bin/bash

apt-get install -y git g++ make

cd ~
git clone https://github.com/jmzhao/dopewild.git
cd dopewild
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
mkdir bin obj; make

cd ~
wget http://i.stanford.edu/hazy/victor/hogwildtl-v03a.tar.gz
tar xf hogwildtl-v03a.tar.gz
cp -r hogwildtl-vv03a/data .

cd ~/dopewild
head -n 2 EXAMPLES | bash
