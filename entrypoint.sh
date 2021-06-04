#!/bin/bash
wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
UU=""
[  "$CLOUDPATH" == "none" ] && CLOUDPATH=""
[  "$USER" == "none" ] && USER=""
[  "$PASSWORD" == "none" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD"
rclone serve  webdav $CLOUDNAME:$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 128M 

