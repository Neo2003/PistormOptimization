#!/usr/bin/bash

BNAME=/lib/systemd/system/
FNAME=${BNAME}systemd-random-seed.service

clean_seed () {
	egrep -q ^ExecStartPre ${FNAME} && return
	sed -i '/^ExecStart/i ExecStartPre=/bin/echo "" >/tmp/random-seed' ${FNAME}
}

main () {
	if [ ! -f ${FNAME} ] 
	then
		echo "File ${FNAME} not found" 
	       	return
	fi

	clean_seed
}

main
