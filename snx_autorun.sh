#!/bin/sh
#export MDEV=${MDEV:-'mpf0p1'}
export MDEV_HOME=$(echo $MDEV | sed 's/p1/p2/g')
echo "orf=$MDEV" >> /tmp/hacks.log  
echo "codons=$MDEV_HOME" >> /tmp/hacks.log 
unlink "media/mpfc2"
unlink "media/mpfc1"
ln -sf "/media/$MDEV" '/media/mpfc1'  >> /tmp/hacks.log 2>&1 

ln -sf "/media/$MDEV_HOME" '/media/mpfc2' >> /tmp/hacks.log 2>&1 

ls -l /usr/bin  >> /tmp/hacks.log 2>&1
/bin/busybox >> /tmp/hacks.log 2>&1
which dpkg  >> /tmp/hacks.log 2>&1
dpkg -l  >> /tmp/hacks.log 2>&1
systemctl ssh status >> /tmp/hacks.log 2>&1
ls /media  >> /tmp/hacks.log 

[ -z "$MDEV" ] && return

echo "$(date) - $0: Running (device: $MDEV)" >> /tmp/hacks.log 2>&1

# if [ ! $(pidof telnetd >/tmp/hack.log) ]; then
#   echo "$(date) - $0: Starting telnetd" >> /tmp/hacks.log 2>&1
#   telnetd &
# else
#   echo "$(date) - $0: Telnetd already running! (PID: $(pidof telnetd))" >> /tmp/hacks.log 2>&1
# fi

if [ ! -d "/tmp/www/cgi-bin" ]; then
	mkdir -p "/tmp/www/cgi-bin";
	echo "$(date) - $0: Created /tmp/www/cgi-bin" >> /tmp/hacks.log 2>&1
fi
for i in /media/$MDEV/bootstrap/www/*; do
  echo "$i -> /tmp/www/cgi-bin/$(basename $i)"
  ln -sf "$i" "/tmp/www/cgi-bin/$(basename $i)" >> /tmp/hacks.log 2>&1
done

start_telnetd()
{
  if [ $(pidof telnetd) ]; then
    pid=$(pidof telnetd)
    echo "Telnetd is already running! (PID: $pid)<br/>"
    echo "Killing PID $pid<br/>"
    kill $pid
    sleep 1
  fi
  /usr/sbin/telnetd &
  sleep 1
  echo "Started (PID: $(pidof telnetd))<br/>"
}

start_telnetd
sh /media/mpfc1/elongate.sh &


