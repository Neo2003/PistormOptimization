apt-get remove --purge triggerhappy logrotate dphys-swapfile avahi*
apt-get autoremove --purge
systemctl disable apt-daily.service
systemctl disable hciuart.service
systemctl disable raspi-config.service
apt-get install busybox-syslogd
apt-get remove --purge rsyslog
rm -rf /var/lib/dhcp /var/lib/dhcpcd5 /var/spool /etc/resolv.conf
ln -s /tmp /var/lib/dhcp
ln -s /tmp /var/lib/dhcpcd5
ln -s /tmp /var/spool
touch /tmp/dhcpcd.resolv.conf
ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf 
