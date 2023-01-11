#!/bin/sh
 
UDC=`ls /sys/class/udc`
CONFIGFS="/sys/kernel/config"
GADGET="$CONFIGFS/usb_gadget"
VID="0x29f1"
PID="0x0510"
SERIAL="0123456789"
MANUF=$(hostname)
PRODUCT="UVC Gadget"

mount -t configfs none /sys/kernel/config/

mkdir -p $GADGET/g1

cd $GADGET/g1
echo $VID > idVendor
echo $PID > idProduct

mkdir -p strings/0x409

echo $SERIAL > strings/0x409/serialnumber
echo $MANUF > strings/0x409/manufacturer
echo $PRODUCT > strings/0x409/product

mkdir configs/c.1

mkdir configs/c.1/strings/0x409

CONFIG="configs/c.1"
FUNCTION="uvc.0"
mkdir functions/$FUNCTION

mkdir -p functions/$FUNCTION/streaming/uncompressed/u/360p

cat <<EOF > functions/$FUNCTION/streaming/uncompressed/u/360p/dwFrameInterval
666666
1000000
10000000
EOF

mkdir functions/$FUNCTION/streaming/header/h
cd functions/$FUNCTION/streaming/header/h
ln -s ../../uncompressed/u
cd ../../class/fs
ln -s ../../header/h
cd ../../class/hs
ln -s ../../header/h
cd ../../class/ss
ln -s ../../header/h
cd ../../../control
mkdir -p header/h
ln -s header/h class/fs
ln -s header/h class/ss
cd ../../../

ln -s functions/$FUNCTION configs/c.1

echo $UDC > UDC
