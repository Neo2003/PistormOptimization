chmod +x 02-Edit-Fstab.sh
chmod +x 03-Complete-RO.sh
chmod +x 04-Move-emulator.sh
apt-get remove --purge triggerhappy logrotate dphys-swapfile avahi*
apt-get autoremove --purge
systemctl disable apt-daily.service
systemctl disable hciuart.service
systemctl disable raspi-config.service
apt-get install busybox-syslogd
apt-get remove --purge rsyslog
