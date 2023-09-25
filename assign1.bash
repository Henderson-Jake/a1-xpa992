#!/bin/bash


while true; do

option=""

echo "Enter one of the following actions or press CTRL-D to exit"
echo "C - create a new item"
echo "R - read an existing item"
echo "U - update an existing item"
echo "D - delete an existing item"
echo "E - update enrolled student count of existing course"
echo "T - show total course count"

	if ! read -r option; then
		exit 0
	fi

	case "$option" in
		c)
			"./create.bash" 
			;;
		r)
			"./read.bash"
			;;
		u)
			"./update.bash"
			;;
		d)
			"./delete.bash"
			;;
		e)
			"./enroll.bash"
			;;
		t)
			"./total.bash"
			;;
		*) echo "invalid input"
			;;
	esac
done
