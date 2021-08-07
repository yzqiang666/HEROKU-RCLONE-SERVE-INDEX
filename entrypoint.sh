#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
mkdir -p /.config/rclone
cat <<-EOF >/.config/rclone/rclone.conf
[team]
type = drive
client_id = #client_id#
client_secret = #client_secret#
scope = drive
token = {"access_token":"#access_token#",  "token_type":"Bearer",  "refresh_token":"#refresh_token#"}
team_drive = #team_drive#
EOF

eval "sed  -i 's/#client_id#/"$GG1_CLIENT_ID"/;s/#client_secret#/"$GG2_CLIENT_SECRET"/;s/#access_token#/"$GG3_ACCESS_TOKEN"/;s/#refresh_token#/"$GG4_REFRESH_TOKEN"/;s/#team_drive#/"$GG5_TEAM_DRIVE"/;'  /.config/rclone/rclone.conf"
#echo =================================
#cat /.config/rclone/rclone.conf
#echo ==========================
rclone version
#echo AAAAAAAAAAAAAAAAAAAAAA
rclone listremotes
#echo BBBBBBBBBBBBBBBBBBBBBBBB
UU=""
[  "$CLOUDPATH" == "none" ] && CLOUDPATH=""
[  "$USER" == "none" ] && USER=""
[  "$PASSWORD" == "none" ] && PASSWORD=""
[ ! "$USER" == "" ] && UU=$UU" --user $USER"
[ ! "$PASSWORD" == "" ] && UU=$UU" --pass $PASSWORD"
echo ############################
rclone serve  webdav team:$CLOUDPATH --addr :$PORT $UU --vfs-read-chunk-size 256M 
echo ###########################
