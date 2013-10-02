#!/bin/bash

CHECK_FILE=somefile
ERRORRANGE=20
HIGHRANGE=20
LOWRANGE=0
somecommand=`echo blah`
stateid=
WWW_DIR=/var/www
OFF=/var/www/off

if [ -f "${OFF}" ]
then
  echo OFF
  stateid=1
  exit $stateid
else


if [ "${somecomand}" -eq 0 ];
  then
    if [ ! \( -e "${WWW_DIR}/${CHECK_FILE}" \) ];
     then
       cd /var/www/
       sudo ln -s ${CHECK_FILE_TMP} ${CHECK_FILE}
     fi
    echo The Global somecommand is OK
    stateid=0
elif [ "${somecommand}" -ge "${LOWRANGE}" ] && [ "${somecommand}" -lt "${HIGHRANGE}" ];
   then
     echo The Global somecommand is in a Warning state at "${somecommand}"
     stateid=1
elif [ "${somecommand}" -ge ${ERRORRANGE} ];
   then
     if [ \( -h "${WWW_DIR}/${CHECK_FILE}" \) ];
      then
        cd /var/www/
        sudo rm ${CHECK_FILE}
      fi
   echo The Global somecommand is in a Critical state at "${somecommand}"
   stateid=2
 fi
 exit $stateid
fi
