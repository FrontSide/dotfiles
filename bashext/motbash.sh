# Message of the Bash

function tillmidnight {

	NOW=`date +%s`
	MIDNIGHT=$((`date +%s -d "23:59:59"` + 1))
	DIFFSEC=`expr ${MIDNIGHT} - ${NOW}`

	date +%H:%M:%S -ud @${DIFFSEC}

}

echo This day is over in $(tillmidnight)




