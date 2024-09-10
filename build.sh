#!/bin/bash

# 下载gost
mkdir gost
if [ "$(uname -m)" = "x86_64" ]; then
  pla="linux_amd64"
  fileName="gost_3.0.0-nightly.20240904_$pla.tar.gz"
  gost_base_url="https://github.com/go-gost/gost/releases/download/v3.0.0-nightly.20240904/$fileName"
  echo "下载 $gost_base_url"
  wget $gost_base_url
else
  pla="linux_arm64"
  fileName="gost_3.0.0-nightly.20240904_$pla.tar.gz"
  gost_base_url="https://github.com/go-gost/gost/releases/download/v3.0.0-nightly.20240904/$fileName"
  echo "下载 $gost_base_url"
  wget $gost_base_url
fi
tar zxvf $fileName -C ./gost
rm $fileName
chmod +x ./gost/gost