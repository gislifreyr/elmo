#!/bin/bash
            
where="$HOME/scrots/`date +%Y/%m/%d`"
file="$where`date +/scrot-%H%M`"

mkdir -p $where                                                                                     
/usr/bin/xwd -display :0.0 -root -out $file.xwd
/usr/bin/convert $file.xwd -define jpeg:extent=200kb $file.jpg
/bin/rm -f $file.xwd
