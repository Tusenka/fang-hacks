source /media/mpfc1/ffmpeg/profile                                              
sh /media/mpfc1/ffmpeg/00-stop-cloud                                                     
sh /media/mpfc1/ffmpeg/20-rtsp-server & gsp=$!
sleep 10
sh /media/mpfc1/ffmpeg/hls_stream.sh &                                                     
sh /media/mpfc1/ffmpeg/fang-ir-control.sh &
