#! /bin/bash 

CONF_FILE=""
if [ -f "/etc/nail.rc" ]
then
    CONF_FILE=/etc/nail.rc
else
    CONF_FILE=/etc/mail.rc
fi

cat ${CONF_FILE} | grep -v "set from" | grep -v "set smtp" > ${CONF_FILE}
echo -en "\nset from=ServerAdmin_Simon@163.com smtp=smtp.163.com\n" >> ${CONF_FILE}
echo -en "\nset smtp-auth-user=ServerAdmin_Simon smtp-auth-password=horsepas28628 smtp-auth=login\n" >> ${CONF_FILE}

# test mail 
MAIL_NAME=mail_conf_test.txt
date > ${MAIL_NAME}
echo -en "\n--------------------------------\nServer System Information:\n" >> ${MAIL_NAME}
uname -a >> ${MAIL_NAME}
echo -en "\n--------------------------------\nServer Network Information:\n" >> ${MAIL_NAME}
ifconfig >> ${MAIL_NAME}
echo -en "\n--------------------------------\nReply to ServerAdmin_Simon@163.com is allowed.\n" >> ${MAIL_NAME}
mail -s "Mail configured successfully with server Information" ServerAdmin_Simon@163.com < ${MAIL_NAME}
rm -rf ${MAIL_NAME}
