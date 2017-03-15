# recursive implementation of fod.sh

name=$1

if [ -f "$name" ]
	then echo "$name is a file."; exit 0
elif [ -d "$name" ]
	then echo "$name is a directory."
	shopt -s nullglob
	for filename in "$name"/*; do
		./$0 "$filename"
	done
else echo -e "$name is not a file or a directory.\nUsage: fod argument\nargument is the name of a file or directory."; exit 1
fi
