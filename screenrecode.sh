#!/bin/bash

bitrate_flag="--bit-rate 8000000"
size_frag="--size 720x1280"
open_when_done=0
FILENAME=`date '+%Y-%m%d-%H%M-%S'`

echo "Recording $FILENAME.mp4..."

adb shell screenrecord $bitrate_flag $size_frag /sdcard/SR_$FILENAME.mp4 | adb logcat -v time >> LOG_$FILENAME.txt
sleep 1

echo
echo "Pulling $FILENAME.mp4 off the device..."
adb pull /sdcard/SR_$FILENAME.mp4

echo
echo "Cleaing up the recording session..."
adb shell rm /sdcard/SR_$FILENAME.mp4

echo
echo "Done! Created `pwd`/SR_$FILENAME.mp4"
