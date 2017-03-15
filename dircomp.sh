# compares the directory and file numbers of two directories

dir1=$1
numDirs1=0
numFiles1=0

dir2=$2
numDirs2=0
numFiles2=0

for filename1 in "$dir1"/*; do
        if [ -d "$filename1" ]
        then ((numDirs1++))
        elif [ -f "$filename1" ]
        then ((numFiles1++))
        fi
done

for filename2 in "$dir2"/*; do
        if [ -d "$filename2" ]
        then ((numDirs2++))
        elif [ -f "$filename2" ]
        then ((numFiles2++))
        fi
done

if (( numDirs1 > numDirs2 ))
then echo "$dir1 has more directories than $dir2"
elif [ "$numDirs1" -eq "$numDirs2" ]
then echo "$dir1  and $dir2 have an equal number of directories."
else echo "$dir2 has more directories than $dir1"
fi

if (( numFiles1 > numFiles2 ))
then echo "$dir1 has more files than $dir2"
elif [ "$numFiles1" -eq "$numFiles2" ]
then echo "$dir1  and $dir2 have an equal number of files."
else echo "$dir2 has more files than $dir1"
fi
