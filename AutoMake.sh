#! /bin/bash 

WORK_PATH=/home/horsepas/Desktop/github/svn-romance-of-seven-hulus/trunk/

cd  ${WORK_PATH}

CMD_RS1=`svn up 2>&1`
CMD_RS2=`svn up 2>&1`

if [ "${CMD_RS1}" != "${CMD_RS2}" ]
then
    echo    "New version detected."
else
    echo    "No new version detected."
    exit
fi

CMD_RST=`./Makefile.py`
CMD_FLG=`echo -en "${CMD_RST}" | grep -E "Error|ERROR"`

if [ -z "${CMD_FLG}" ]
then
    svn ci -m "Automatical build."
else
    echo    "Failed to build."
    exit
fi

