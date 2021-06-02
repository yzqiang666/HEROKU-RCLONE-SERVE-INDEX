#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone listremotes
#refreshing Rclone
wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
rclone version
rclone listremotes
UU=""
[  "$CLOUDPATH" == "demo" ] && CLOUDPATH=""
[  "$USER" == "user" ] && USER=""
[  "$PASSWORD" == "password" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD "
echo CLOUDPATH=$CLOUDPATH *******   $UU
rclone serve  webdav $CLOUDNAME:$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 128M 

