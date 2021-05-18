mkdir /mnt/Amiga
mount /mnt/Amiga
chmod ugo+rwx /mnt/Amiga/
mv /home/pi/pistorm /mnt/Amiga/
chown -R pi:pi /mnt/Amiga/pistorm
