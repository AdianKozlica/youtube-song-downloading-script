#!/bin/bash

[[ -z $1 ]] && echo "Missing song file!" && exit
[ ! -f $1 ] && echo "File doesn't exist!" && exit

SONGS=$(cat $1)

[[ -z $2 ]] && echo "Missing output dir!" && exit
[ ! -d "$2" ] && echo "Directory doesn't exist!" && exit
[ ! -d music/ ] && mkdir music/

for song in $SONGS; do
    yt-dlp -x $song -P "music/"
done

cp music/* "$2"
rm -rf music/
