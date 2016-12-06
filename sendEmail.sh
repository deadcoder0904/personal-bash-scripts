#!/bin/sh

printUsage()
{
  echo "usage: $0 options"
  echo  
  echo "This script sends its standard input to the specified email address."
  echo  
  echo "OPTIONS:"
  echo " -e email@address to notify"
  echo " -s \"subject string\""
  echo " -a \"send as attachment\""
  echo "Enter Body Text or Press Ctrl+D or Cmd+D to Exit"
}

printUsage

#default values
sendto="akshaykadam0904@gmail.com"
subject="Automated Email"
from="thinkpad"
errorsfile=/tmp/ssmtp.error

while getopts 'ae:s:' option
do
  case $option in
    e) sendto=$OPTARG;;
    s) subject=$OPTARG;;
    a) doatt=1;;
    *) printUsage
       exit 1
       ;;
  esac
done

header="Subject: ${subject}\nFrom:${from}\nTo:${sendto}\n"
cmd=cat
attach="\n"
[ -n "$doatt" ] && {
  attach="Content-Type: multipart/mixed; boundary=012345\n\n--012345\n"
  attach="${attach}Content-Type: text/plain; charset=iso-8859-1\n\n\n\n--012345\n"
  attach="${attach}Content-Type: application/octet-stream; name=\"message.bin\"\n"
  attach="${attach}Content-Transfer-Encoding: base64\n"
  attach="${attach}Content-Disposition: attachment; filename=\"message.bin\"\n"
  attach="${attach}X-Attachment-Id: file0\n\n"
  ending="\n--012345--"

  if [ -n "$(which base64)" ]; then
    cmd=base64
  else
    cmd=openssl\ base64
  fi
}

# workaround for the 'sh echo' not handling -e
if [ -n "$(/bin/sh -c 'echo -ne')" ]; then
  echocmd=echo
else
  echocmd=echo\ -e
fi

$echocmd "${header}${attach}$($cmd)${ending}" | ssmtp "${sendto}" 2>>${errorsfile}
exit $?

# send a simple message to the default address address
# echo -e "test\nmessage" | notifyemail.sh

# send a file as a plain text to the specified email address
# cat ~/.vimrc | notifyemail.sh -e here@mail.com -s "Here is my .vimrc you asked for"

# send an encrypted file as an attachment
# cat ~/classified.txt | encrypt | notifyemail.sh -a -s "top secret attach"

# same as above with the password been read from ~/mypass
# cat ~/classified.txt | encrypt -pass file:~/mypass | notifyemail.sh -a -s "top secret attach"