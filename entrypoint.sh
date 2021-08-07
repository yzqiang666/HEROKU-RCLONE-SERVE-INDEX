#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone listremotes
cat <<-EOF >/.config/rclone/rclone.conf
[team]
type = drive
client_id = #client_id#
client_secret = #client_secret#
scope = drive
token = {"access_token":"#access_token#",  "token_type":"Bearer",  "refresh_token":"#refresh_token#"}
team_drive = #team_drive#
EOF

eval "sed  -i 's/#client_id#/"$CLIENT_ID"/;s/#client_secret#/"$CLIENT_SECRET"/;s/#access_token#/"$ACCESS_TOKEN"/;s/#refresh_token#/"$REFRESH_TOKEN"/;s/#team_drive#/"$TEAM_DRIVE"/;'  /.config/rclone/rclone.conf"
echo =================================
cat /.config/rclone/rclone.conf
echo ==========================
rclone version
rclone listremotes
UU=""
[  "$CLOUDPATH" == "none" ] && CLOUDPATH=""
[  "$USER" == "none" ] && USER=""
[  "$PASSWORD" == "none" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD"
echo ############################
rclone serve  webdav $CLOUDNAME:$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 256M 
echo ###########################
