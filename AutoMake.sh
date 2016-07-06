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

CMD_RST=`nohup ./Makefile.py 1>log.make.txt 2>&1`
sleep 60
CMD_FLG=`ps aux | grep "pdflatex seven-hulus-main.tex" | grep -v "grep" | awk '{ print $2 }'`

if [ -z "${CMD_FLG}" ]
then
    echo    "pdflatex exited in time."
    CMD_RST=`cat ./log.make.txt | grep -E "Error|ERROR"`
    if [ -z "${CMD_RST}" ]
    then
        echo    "build successfully."
        svn ci -m "Automatical build."
    else
        echo    "rebuild failed."
        echo    "Failed to build." | mail -s "Seven-hulus: Rebuld FAILED"   liu-xj12@mails.tsinghua.edu.cn  yuanzhigang10@163.com
    fi
else
    kill -9 ${CMD_FLG}
    echo    "pdflatex killed."
    echo    "Failed to build." | mail -s "Seven-hulus: Rebuld FAILED"   liu-xj12@mails.tsinghua.edu.cn  yuanzhigang10@163.com
    exit
fi

