# Fang Hacks
# Fang Hacks
My version of FANG HACKS
What changes:
* stop china cloud by default
* magic constants replacement
* rtsp by default 
* telnet by default
* custom rtsp server by default

Connect:
https://www.youtube.com/watch?v=0xeapuUELHw
* Find Ip of the cam
* Your wifi must be secured
* Setup your rtsp stream
Or
access your rtsp
  
* telnet/ssh: 
telnet 192.168.0.xxx

You don't need ext2
just fat32

Install
format sd two partitions fat32
* primery partition  - bootstrap + snx_autorun.sh + ffmpeg
* secondary partition: data
* adjust secondary one to eliminate magic constants for partitions names
* you could adjust your rtsp stream by /profile
* you could sh to the cam via telnet root/ismart12
