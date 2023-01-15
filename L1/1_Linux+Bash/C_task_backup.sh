#! /usr/bin/env bash
#echo "C. Create a data backup script that takes the following data as parameters:"
#1. Path to the syncing directory.
#2. The path to the directory where the copies of the files will be stored.
#In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]

echo " Input path to syncing directory (What to backup)"
read SYNDIR
echo "Input the path to the directory where the copies of the files will be stored (Where to backup to)"
read STORDIR
#control_start=$( cat du -sh $STORDIR | cut -d' ' -f1 )

# Create archive filename
BDATE=$( date +'%Y.%m.%d-%H:%M:%S' )
FILENAME=$( hostname -s )_$BDATE

#Backing up the files
## Create change monitoring function
event=create,delete
f_monitoring(){
inotifywait -q -m -e $event $STORDIR --format '%w%f %e %T' --timefmt '%Y.%m.%d-%H:%M:%S' > log.txt &
}

echo "Monitoring $STORDIR  $( f_monitoring ) " 
##kill the monitor on backup restore done, and/or on script exit
wrapup() {
    [[ $COPROC_PID ]] && kill -INT "$COPROC_PID"
}

trap 'wrapup'  EXIT
#Backing up the files
tar -cf $STORDIR/$FILENAME.tar $SYNDIR

#echo $( cat log.txt )
