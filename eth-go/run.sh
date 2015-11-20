

mkdir -p /data

sudo docker run -t -i -P=false -v /data:/data iruka/eth:base  /bin/bash
