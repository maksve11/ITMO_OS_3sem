trash=~/.trash
trashlog=~/.trash.log
filename=$1
link=0

if [ $# != 1 ]; then
    exit 1
fi

if [ ! -d $trash ]; then
    mkdir $trash
fi

if [ ! -f $trashlog ]; then
    touch $trashlog
fi

trashname=$filename-$link
while [ -f $trash/$trashname ]; do
    (( version++ ))
    trashname=$filename-$link
done

ln $filename $trash/$trashname
rm $filename && echo $(realpath $filename) $trashname >> $trashlog