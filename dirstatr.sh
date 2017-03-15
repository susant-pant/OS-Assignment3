# recursive version of dirstat.sh

numFiles=0
numDirs=0

countArgs()
{
	argdir=$1
	for filename in "$argdir"/*; do
        	if [ -f "$filename" ]
        		then ((numFiles++))
        	elif [ -d "$filename" ]
        		then ((numDirs++))
			countArgs "$filename"
		fi
	done
}
countArgs $1
echo -e "There are $numDirs directories and $numFiles files in $1."
