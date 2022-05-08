
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#Env variable
touch /tmp/log4j.sh
chmod 755 /tmp/log4j.sh
echo "export LOG4J_FORMAT_MSG_NO_LOOKUPS=true" >> /tmp/log4j.sh
sudo mv /tmp/log4j.sh /etc/profile.d/log4j.sh
cat /etc/profile.d/log4j.sh
export LOG4J_FORMAT_MSG_NO_LOOKUPS=true
echo $LOG4J_FORMAT_MSG_NO_LOOKUPS

# log4j-core
oIFS=$IFS
IFS=$'\n'
find / -name 'log4j-core-*.jar' | while read -r i; do
#  if [[ $i == *"2.14"* ]] || [[ $i == *"2.11"* ]] ; then
    echo "zip -q -d $i org/apache/logging/log4j/core/lookup/JndiLookup.class"
    zip -q -d $i org/apache/logging/log4j/core/lookup/JndiLookup.class
    echo $?
#  fi
done
IFS=$oIFS

# log4j-1.x
oIFS=$IFS
IFS=$'\n'
find / -name 'log4j-1*.jar' | while read -r i; do
    echo "zip -q -d $i org/apache/log4j/net/JMSAppender.class"
    zip -q -d $i org/apache/log4j/net/JMSAppender.class
    echo $?
done
IFS=$oIFS
