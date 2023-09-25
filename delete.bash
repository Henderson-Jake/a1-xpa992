#!/bin/bash

get_course_name() {
	read dept_code dept_name
	read course_name
	echo date "DELETED: $dept_code $course_num $course_name"

}

read -p "Enter a course department code and number: " dept_code course_num

filename="data/$dept_code$course_num.crs"

if [ -s "$filename" ]; then
	get_course_name < "$filename"
	rm "$filename"
	echo "$course_num was successfully deleted"
else 
	echo "ERROR: course not found"
	exit 1
fi
