#!/bin/bash
ip=`ifconfig virbr0|awk '/inet/{print $2}'`
echo "本机的ip地址为$ip"
cpu=`uptime|awk '{print $NF}'`
echo "本机最近15分钟的负载是$cpu"
net_in=`ifconfig enp0s17|awk '/RX p/{print $5}'`
echo "本机的入网流量为$net_in Kb"
net_out=`ifconfig enp0s17|awk '/TX p/{print $5}'`
echo "本机的出站流量为$net_out Kb"
mem=`free -m |awk '/Mem/{print $4}'`
echo "本机的内存剩余容量为$mem M"
disk=`df -h| awk '/\/$/{print $4}'`
echo "本机的根分区剩余容量为$disk"
user=`cat /etc/passwd|wc -l`
echo "本机已有用户为$user个"
who=`who|wc -l`
echo "本机已登录用户有$who个"
process=`ps -aux|wc -l`
echo "本机已有进程$process个"
soft=`rpm -qa|wc -l`
echo "本机已安装程序有$soft个"
