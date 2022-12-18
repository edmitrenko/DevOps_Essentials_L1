#/bin/env bash

SRC_DIR=$1
DST_DIR=$2

check-backups-dir() {
	dst=$1
	if ! [ -d $dst ]; then
	mkdir $dst
	echo "Create $dst directory for backup"
	fi
}

notify () {
    event=$1
    src=$2

    echo "Backup $event for the $src at $(date +"%d-%m-%Y:%H:%M:%S")"
}

makebackup() {
    where=$1
    what=$2
    tar -cvpzf  $where/Backup-$(date +"%d-%m-%Y:%H:%M").tgz  $what  > $where/Backup.log 2> /dev/null
}
################################################################################################

check-backups-dir $DST_DIR
notify "STARTED" $SRC_DIR

if makebackup $DST_DIR $SRC_DIR; then
    notify "FINISHED" $SRC_DIR
else
    notify "FAILED" $SRC_DIR
fi


