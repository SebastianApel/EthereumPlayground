set -e
set -x

if [ -f /etc/disk_added_date ]
then
   echo "disk already added so exiting."
   exit 0
fi


sudo fdisk -u /dev/sdb <<EOF
n
p
1


t
85
w
EOF

mkfs.ext4 /dev/sdb1
mkdir /data
echo "/dev/sdb1 /data ext4 defaults 0 0" >> /etc/fstab
mount /data

#pvcreate /dev/sdb1
#vgextend VolGroup /dev/sdb1
#lvextend /dev/VolGroup/lv_root
#resize2fs /dev/VolGroup/lv_root

date > /etc/disk_added_date