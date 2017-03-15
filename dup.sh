# lists all identical sub-directories (recursively) under the current working directory. Note that two directories are identical if they have the same number of files and same names for all the files.

argdir=$1

# code from http://stackoverflow.com/questions/18884992/how-do-i-assign-ls-to-an-array-in-linux-bash
# and from http://mywiki.wooledge.org/ParsingLs
shopt -s nullglob
array=("$argdir"/*)
shopt -u nullglob # Turn off nullglob to make sure it doesn't interfere with anything later
# end of borrowed code

arraylength=${#array[@]}

for (( i=0; i<${arraylength}; i++ ))
do
	if [ -d "${array[i]}" ]
	then
		dir1=${array[i]}
		for (( j=$((i+1)); j<${arraylength}; j++ ))
		do
			if [ -d "${array[j]}" ]
			then
				dir2=${array[j]}
				# check to see if correct directories are being compared
				echo -e "Comparing $dir1 and $dir2"

				ls1=`cd "$dir1"; ls -R .`
				ls2=`cd "$dir2"; ls -R .`
				if [ "$ls1" == "$ls2" ]
				then echo -e "These directories are identical.\n"
				fi
			fi
		done
	fi
done
