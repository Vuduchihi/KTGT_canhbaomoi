#!/bin/sh

export content=""

file_results="/home/kali/nefias/results"

#filename=""
filename=$(ls -lh $file_results | awk '{print  "/home/kali/nefias/results/"$9}')
#echo $filename

for eachfile in $filename
do
	#echo $eachfile
	while read input_eachfile
	do
		#echo $input_eachfile
		content="$content||||||||$input_eachfile"
	done < $eachfile
	
	#echo "- - - - - - - - - - - - - - - -"
done

echo "Content:" "\n" $content

python /home/kali/KTGT_canhbaomoi/main.py $content

