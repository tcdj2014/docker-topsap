#!/bin/bash

# 下载gost
fileName="gost_3.0.0-nightly.20240904_$pla.tar.gz"
gost_base_url="https://github.com/go-gost/gost/releases/download/v3.0.0-nightly.20240904/$fileName"
pla="linux_arm64"
mkdir gost_arm64
echo "下载 $gost_base_url"
wget $gost_base_url
tar zxvf $fileName -C ./gost_arm64
chmod +x ./gost_arm64/gost
pla="linux_amd64"
mkdir gost_amd64
echo "下载 $gost_base_url"
wget $gost_base_url
tar zxvf $fileName -C ./gost_amd64
chmod +x ./gost_amd64/gost