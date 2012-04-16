#!/bin/bash -
#
# Copyright (C) 2012 Xiao-Wei Song <dawnwei.song@gmail.com>
#
#just for backup each dot files and hard linked them to make sure I can use github.com to store them

elog(){ echo "$@" 1>&2 ; }

if [ $# -lt 2 ]; then
  elog "Usage: $0 from to [ignore patterns]" 
  exit 1
fi 

fd=$(readlink -f $1)
td=$(readlink -f $2)
mkdir -p $td

#copy dir tree without file
rsync -a --include='*/' --exclude='*'  $fd/ $td/
#clear git directory
find $td -type d -name '.git' -exec rm -rf {} \;

bakf="bak/bak.$(basename $fd).$(date +%Y%m%d.%H%M).tar.bz2"
find $fd | sed '/^.*\.git.*$/d' | xargs tar jcvf $bakf

#hard link each file
find $fd -type f  ! -iwholename '*.git*' ! -iwholename '*.hg*' | sed 's|'"$fd"'||g' |
while read f; do 
  #echo $f
  ln $fd/$f  $td/$f
done

