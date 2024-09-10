#!/bin/bash

# 下载gost
pla=linux_arm64
fileName=gost_3.0.0-nightly.20240904_$pla.tar.gz
gost_base_url=https://github.com/go-gost/gost/releases/download/v3.0.0-nightly.20240904/$fileName

if [ "$(uname -m)" = "x86_64" ]; then
  pla=linux_amd64
  wget https://github.com/go-gost/gost/releases/download/v3.0.0-nightly.20240904/$fileName -o $fileName
else
  curl https://github.com/go-gost/gost/releases/download/v3.0.0-nightly.20240904/$fileName -o $fileName
fi
mkdir gost
tar zxvf $fileName -C ./gost
chmod +x ./gost/gost