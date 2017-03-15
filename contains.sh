# checks if one of the argument directories is a sub-directory of the other

dir1=$1
dir2=$2

for filename1 in "$dir1"/*; do
        if [ -d "$filename1" ]
        then	if [[ "$dir2" -ef "$filename1" ]]
		then echo "$dir1 contains $dir2"; exit 0
		fi
	fi
done

for filename2 in "$dir2"/*; do
	if [ -d "$filename2" ]
	then	if [[ "$dir1" -ef "$filename2" ]]
		then echo "$dir2 contains $dir1"; exit 0
		fi
	fi
done
echo "Neither directory contains the other."
