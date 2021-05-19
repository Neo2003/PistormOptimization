#!/usr/bin/bash

BNAME=/boot/
FNAME=${BNAME}config.txt


disable_splash() {
	egrep -q disable_splash ${FNAME} && return
	sed -i '/\[all\]/a disable_splash=1' ${FNAME}
}

disable_bluetooth() {
	egrep -q pi3-disable-bt ${FNAME} && return
	sed -i '/\[all\]/a dtoverlay=pi3-disable-bt' ${FNAME}
}

overclock() {
	egrep -q overclock_50 ${FNAME} && return
	sed -i '/\[all\]/a dtoverlay=sdtweak,overclock_50=100' ${FNAME}
}

set_boot_delay() {
	egrep -q boot_delay ${FNAME} && return
	sed -i '/\[all\]/a boot_delay=0' ${FNAME}
}

add_all_section() {
	egrep -q '^\[all\]' ${FNAME}  && return
	echo "[all]" >> ${FNAME}
}

main () {
	if [ ! -f ${FNAME} ] 
	then
		echo "pas de fichier ${FNAME} present" 
	       	return
	fi
	add_all_section
	disable_splash
	disable_bluetooth
	overclock
	set_boot_delay 
}

main
