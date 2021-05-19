#!/usr/bin/bash

FNAME=/boot/cmdline.txt

add_cmd () {
	egrep -q fastboot ${FNAME} || sed -i 's/$/ fastboot/' ${FNAME}
	egrep -q noswap   ${FNAME} || sed -i 's/$/ noswap/'   ${FNAME}
	egrep -qw ro      ${FNAME} || sed -i 's/$/ ro/'       ${FNAME}
}

main () {
	if [ ! -f ${FNAME} ] 
	then
		echo "File ${FNAME} is not present" 
	       	return
	fi

	add_cmd
}

main
