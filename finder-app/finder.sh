#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Error: Both arguments (filesdir and searchstr) are required."
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [ -z "$filesdir" ]; then
    echo "Error: Directory path (filesdir) not specified."
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

matching_lines=$(find "$filesdir" -type f -exec grep -H "$searchstr" {} + | wc -l)
number_of_files=$(find "$filesdir" -type f | wc -l)

echo "The number of files are $number_of_files and the number of matching lines are $matching_lines"
exit 0
