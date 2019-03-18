#!/usr/bin/bash

echo "检查防火墙"
echo "-----------------------------info---------------------------"

echo "iptables info :"
service iptables status
echo "------------------------------------------------------------"
systemctl status iptables
echo "------------------------------------------------------------"

echo "filewall info :"
systemctl status firewalld
echo "------------------------------------------------------------"
systemctl status firewalld
echo "------------------------------------------------------------"

echo "selinux info :"
sestatus
echo "------------------------------------------------------------"
