#!/bin/sh

if [ $# -ne 2 ]; then
	echo "Error: Both arguments (writefile and writestr) are required."
	exit 1
fi

writefile="$1"
writestr="$2"

if [ -z "$writefile" ]; then
	echo "Error: File path (writefile) not specified."
	exit 1
fi

if [ -z "$writestr" ]; then
	echo "Error: Text string to write (writestr) not specified."
	exit 1
fi

mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
	echo "Error: Failed to create or write to the file."
	exit 1
fi

echo "File '$writefile' created successfully with content: '$writestr'"
exit 0
