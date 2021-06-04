FROM nginx:1.19.6
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
#    && apt install -y fuse\   
    && apt install -y wget\
    && apt install -y unzip
#RUN mknod -m 666 /dev/fuse c 10 229 && modprobe fuse

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

COPY entrypoint.sh /entrypoint.sh
#COPY developeranaz-rc.zip /developeranaz-rc.zip
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
