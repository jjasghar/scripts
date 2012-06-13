#!/usr/local/bin/bash

VDI_DIR='/home/asgharje/vdi/'
UBUNTU_GOLD_VDI="ubuntu_11_10_gold.vdi"
REDHAT_GOLD_VDI="centos_6_2_gold.vdi"


echo "Name of VM"
read name_of_vm
VBoxManage unregistervm "$name_of_vm" --delete
cd $VDI_DIR
rm *_$name_of_vm.vdi
