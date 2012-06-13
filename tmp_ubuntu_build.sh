#!/usr/local/bin/bash

VBoxManage clonehd ubuntu_11_10_gold.vdi ubuntu_11_10_tmp.vdi
VBoxManage createvm --name "tmp" --ostype "Ubuntu" -register
VBoxManage modifyvm "tmp" --memory 4096 --boot1 dvd
VBoxManage storagectl "tmp" --name "IDE Controller" --add ide
VBoxManage storageattach "tmp" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium ubuntu_11_10_tmp.vdi
VBoxManage modifyvm "tmp" --nic1 bridged --nictype1 82543GC --bridgeadapter1 em0
VBoxHeadless -s "tmp" -n