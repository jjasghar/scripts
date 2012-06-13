#!/usr/local/bin/bash

VDI_DIR='/home/asgharje/vdi/'
UBUNTU_GOLD_VDI="ubuntu_11_10_gold.vdi"
REDHAT_GOLD_VDI="centos_6_2_gold.vdi"
HOST_NIC="em0"


echo "Name of VM"
read name_of_vm
echo "OS type (Ubuntu, RedHat_64)"
read ostype
cd $VDI_DIR
if [ "$ostype" = "Ubuntu" ]; then
    echo "Cloning Ubuntu vdi"
    VBoxManage clonehd $UBUNTU_GOLD_VDI ubuntu_11_10_$name_of_vm.vdi
elif [ "$ostype" = "RedHat_64" ]; then
    echo "Cloning RedHat vdi"
    VBoxManage clonehd $REDHAT_GOLD_VDI centos_6_2_$name_of_vm.vdi
else
    clear;
    echo "something broke"
fi
VBoxManage createvm --name "$name_of_vm" --ostype "$ostype" -register
echo "Adding 4gigs of memory"
VBoxManage modifyvm "$name_of_vm" --memory 4096 --boot1 dvd
echo "Adding the storage ide controller"
VBoxManage storagectl "$name_of_vm" --name "IDE Controller" --add ide
echo "Attaching vdi to storage controller"
if [ "$ostype" = "Ubuntu" ]; then
    VBoxManage storageattach "$name_of_vm" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium ubuntu_11_10_$name_of_vm.vdi
fi
if [ "$ostype" = "RedHat_64" ]; then
    VBoxManage storageattach "$name_of_vm" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium centos_6_2_$name_of_vm.vdi
fi
echo "Adding NIC and making it a bridge adapter"
VBoxManage modifyvm "$name_of_vm" --nic1 bridged --nictype1 82543GC --bridgeadapter1 $HOST_NIC
clear
echo ""
echo ""
echo ""
echo "Starting it in headless mode have fun!"
echo ""
echo ""
echo "Check the NIC, it could change and you'll have to edit it via the console, hence the VNC connection here in a sec"
echo ""
echo ""
VBoxHeadless -s "$name_of_vm" -n 
cd $HOME