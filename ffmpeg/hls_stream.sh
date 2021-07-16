#!/bin/sh

kill $(pidof ffmpeg)
/media/mpfc1/ffmpeg/ffmpeg -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -i rtsp://localhost/unicast -f flv $STREAM