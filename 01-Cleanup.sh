chmod +x 02-Edit-Fstab.sh
chmod +x 03-Complete-RO.sh
chmod +x 04-Move-emulator.sh
apt-get -y remove --purge triggerhappy logrotate dphys-swapfile avahi*
apt-get -y autoremove --purge
systemctl disable apt-daily.service
systemctl disable hciuart.service
systemctl disable raspi-config.service
apt-get -y install busybox-syslogd
apt-get -y remove --purge rsyslog
