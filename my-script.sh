#!/bin/bash
#echo "Enter the full path to the file."
#read file
#filesize=$(ls -lh $file | awk '{print  $5}')
#echo "$file has a size of $filesize"

export file_username="/home/kali/nefias/results"
filesize_old=$(ls -lh $file_username | awk '{print  $5}')
filesize_new=$filesize_old
echo $filesize_old

while :
do
	while [ "$filesize_old" == "$filesize_new" ]
	do
		filesize_new=$(ls -lh $file_username | awk '{print  $5}')
		sleep 2
		echo "khong bi thay doi ..."
	done
	
	./whileread.sh
	
	filesize_old=$filesize_new
done
