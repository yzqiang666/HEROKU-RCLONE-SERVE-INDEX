#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
###curl "https://pastebin.com/raw/bjzadHka" >status
###bash status | grep 'working\|maintenance'
rclone version
rclone listremotes
#refreshing Rclone
#wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
mkdir -p /.config/rclone

echo "$RCLONE_INFO" >>'/.config/rclone/rclone.conf'
rclone version
rclone listremotes
UU=""
[  "$CLOUDPATH" == "none" ] && CLOUDPATH=""
[  "$USER" == "none" ] && USER=""
[  "$PASSWORD" == "none" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD"
[  "$CLOUDNAME" == "none" ] && CLOUDNAME=""
if [  "$CLOUDNAME" == "" ] ; then
  CLOUDNAME=`rclone listremotes|head -n 1`
else
  CLOUDNAME=$CLOUDNAME":"
fi
rclone serve  webdav $CLOUDNAME$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 256M 

