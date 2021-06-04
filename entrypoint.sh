#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone listremotes
#refreshing Rclone
wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
rclone version
rclone listremotes
UU=""
[  "$CLOUDPATH" == "none" ] && CLOUDPATH=""
[  "$USER" == "none" ] && USER=""
[  "$PASSWORD" == "none" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD "
mkdir /opt
rclone mount $CLOUDNAME:$CLOUDPATH /opt \
--copy-links \
--no-gzip-encoding \
--no-check-certificate \
--umask 0000 \
--default-permissions \
--allow-non-empty \
--allow-other \
--buffer-size 32M \
--dir-cache-time 12h \
--vfs-read-chunk-size 64M \
--vfs-read-chunk-size-limit 128M &

rclone serve  webdav $CLOUDNAME:$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 128M 

