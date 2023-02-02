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

# mkdir -p functions/$FUNCTION/streaming/uncompressed/u/480p

# echo "10000000" > functions/$FUNCTION/streaming/uncompressed/u/480p/dwFrameInterval
# echo "10000000" > functions/$FUNCTION/streaming/uncompressed/u/480p/dwDefaultFrameInterval
# echo "460800" > functions/$FUNCTION/streaming/uncompressed/u/480p/dwMaxBitRate
# echo "460800" > functions/$FUNCTION/streaming/uncompressed/u/480p/dwMaxVideoFrameBufferSize
# echo "460800" > functions/$FUNCTION/streaming/uncompressed/u/480p/dwMinBitRate
# echo "480" > functions/$FUNCTION/streaming/uncompressed/u/480p/wHeight
# echo "640" > functions/$FUNCTION/streaming/uncompressed/u/480p/wWidth

# mkdir -p functions/$FUNCTION/streaming/uncompressed/u/360p

# echo "10000000" > functions/$FUNCTION/streaming/uncompressed/u/360p/dwFrameInterval
# echo "10000000" > functions/$FUNCTION/streaming/uncompressed/u/360p/dwDefaultFrameInterval
# echo "345600" > functions/$FUNCTION/streaming/uncompressed/u/360p/dwMaxBitRate
# echo "345600" > functions/$FUNCTION/streaming/uncompressed/u/360p/dwMaxVideoFrameBufferSize
# echo "345600" > functions/$FUNCTION/streaming/uncompressed/u/360p/dwMinBitRate
# echo "360" > functions/$FUNCTION/streaming/uncompressed/u/360p/wHeight
# echo "640" > functions/$FUNCTION/streaming/uncompressed/u/360p/wWidth

mkdir -p functions/$FUNCTION/streaming/uncompressed/u/720p

echo "2000000" > functions/$FUNCTION/streaming/uncompressed/u/720p/dwFrameInterval
echo "2000000" > functions/$FUNCTION/streaming/uncompressed/u/720p/dwDefaultFrameInterval
echo "47001600" > functions/$FUNCTION/streaming/uncompressed/u/720p/dwMaxBitRate
echo "1175040" > functions/$FUNCTION/streaming/uncompressed/u/720p/dwMaxVideoFrameBufferSize
echo "47001600" > functions/$FUNCTION/streaming/uncompressed/u/720p/dwMinBitRate
echo "720" > functions/$FUNCTION/streaming/uncompressed/u/720p/wHeight
echo "1088" > functions/$FUNCTION/streaming/uncompressed/u/720p/wWidth

# mkdir -p functions/$FUNCTION/streaming/uncompressed/u/1080p

# echo "10000000" > functions/$FUNCTION/streaming/uncompressed/u/1080p/dwFrameInterval
# echo "10000000" > functions/$FUNCTION/streaming/uncompressed/u/1080p/dwDefaultFrameInterval
# echo "3110400" > functions/$FUNCTION/streaming/uncompressed/u/1080p/dwMaxBitRate
# echo "3110400" > functions/$FUNCTION/streaming/uncompressed/u/1080p/dwMaxVideoFrameBufferSize
# echo "3110400" > functions/$FUNCTION/streaming/uncompressed/u/1080p/dwMinBitRate
# echo "1080" > functions/$FUNCTION/streaming/uncompressed/u/1080p/wHeight
# echo "1920" > functions/$FUNCTION/streaming/uncompressed/u/1080p/wWidth

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
