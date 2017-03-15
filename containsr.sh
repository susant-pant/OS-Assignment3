# recursive version of contains.sh

dir1=$1
dir2=$2

lines1=$(find "$dir1" -type d -wholename  ""$dir2"" | wc -l)
if [ $lines1 -eq 0 ]; then
	lines2=$(find "$dir2" -type d -wholename  ""$dir1"" | wc -l)
	if [ $lines2 -eq 0 ]; then
		echo "Neither directory contains the other."
	else echo "$dir2 contains $dir1"
	fi
else echo "$dir1 contains $dir2"
fi
