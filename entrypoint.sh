#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone listremotes
#refreshing Rclone
wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
echo "$RCLONE_INFO" >'/.config/rclone/rclone1.conf'
cat /.config/rclone/rclone1.conf
rclone version
rclone listremotes
UU=""
[  "$CLOUDPATH" == "none" ] && CLOUDPATH=""
[  "$USER" == "none" ] && USER=""
[  "$PASSWORD" == "none" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD"
rclone serve  webdav $CLOUDNAME:$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 256M 
