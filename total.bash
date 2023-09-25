#!/bin/bash

my_dir=$(dirname "$0")
if [ ! -d "$my_dir/data" ]; then
	echo "ERROR: invalid option"
	exit 1
fi

total=0
for file in $my_dir/data/*.crs; do
	if [ -e "$file" ]; then
		((total++))
	fi
done

echo "Total course records: $total"

