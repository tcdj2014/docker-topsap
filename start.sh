#!/bin/bash
# 判断tun0是否存在的
if [ -e /dev/net/tun ]; then
  :
else
  # mac 无/dev/net/tun设备，容器内手动创建
  # sudo mkdir /dev/net
  # sudo mknod /dev/net/tun c 10 200
  # sudo ip tuntap add mode tap tap
  #echo "/dev/net/tun doesn't exist. Please create it first." >&2
  #exit 1
  mkdir /dev/net
  mknod -m 0666 /dev/net/tun c 10 200
fi

# 定义一个处理函数，用于在接收到 INT 信号时退出脚本
function cleanup {
  echo "Exiting script..."
  exit 0
}

# 捕获 INT 信号，并调用 cleanup 函数
trap cleanup INT

sed -i "s/{{server_address}}/$SERVER_ADDRESS/g" expect.exp
sed -i "s/{{user_name}}/$USER_NAME/g" expect.exp
sed -i "s/{{password}}/$PASSWORD/g" expect.exp

cd /opt/TopSAP && ./sv_websrv >/home/work/sv_websrv.log 2>&1 &

sleep 1

expect -f expect.exp


./gost/gost -L socks5://:1080 -L http://:1081 -L http://ttx:ttx2011@:1082

