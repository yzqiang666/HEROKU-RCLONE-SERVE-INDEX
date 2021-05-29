#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone listremotes
#refreshing Rclone
wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
rclone version
rclone listremotes
rclone serve  webdav $CLOUDNAME:$CLOUDPATH --addr :$PORT --user yzqiang --pass yzqyzq1234 --vfs-read-chunk-size 128M
