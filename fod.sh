#takes name as input, returns whether name is a file, a directory, or neither

name=$1

if [ -d "$name" ]
then echo "$name is a directory."; exit 0
elif [ -f "$name" ]
then echo "$name is a file."; exit 0
else echo -e "The argument is not a file or a directory.\nUsage: fod argument\nargument is the name of a file or directory."; exit 1
fi
