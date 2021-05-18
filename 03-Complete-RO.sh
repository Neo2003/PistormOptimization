rm -rf /var/lib/dhcp /var/lib/dhcpcd5 /var/spool /etc/resolv.conf
ln -s /tmp /var/lib/dhcp
ln -s /tmp /var/lib/dhcpcd5
ln -s /tmp /var/spool
touch /tmp/dhcpcd.resolv.conf
ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf
cat bash_logout > /etc/bash.bash_logout
cat bashrc >> /etc/bash.bashrc
cat fstab_add >> /etc/fstab
