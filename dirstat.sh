# counts the number of files and sub-directories in the argument directory

argdir=$1
numFiles=0
numDirs=0

for filename in "$argdir"/*; do
	if [ -d "$filename" ]
	then ((numDirs++))
	elif [ -f "$filename" ]
	then ((numFiles++))
	fi
done
echo -e "There are $numDirs directories and $numFiles files in $argdir."
