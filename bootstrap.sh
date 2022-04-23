#!/bin/env bash
REPOSITORY="git@github.com:fbanville/fedora-desktop.git"

# Making sure we run this as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo "[Info ] adding minimum dependencies"
dnf update -y
dnf install -y  python3 python3-pip
pip3 install --upgrade pip
pip3 install ansible

echo "[Info ] updating configuration instructions"
echo "[Info ] lauching ansible and configure desktop"
ansible-playbook config.yaml

exit 0

