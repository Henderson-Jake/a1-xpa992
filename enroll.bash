#!/bin/bash

read -p "Enter a department code and course number: " dept_code course_num
read -p "Enter an enrollment change amount: " change_amt

dept_code=${dept_code^^}

filename="data/$dept_code$course_num.crs"

if [ ! -r "$filename" ]; then
	echo "ERROR: course not found"
	exit 1
fi

read -r orig_dept_code orig_dept_name < $filename

while read line; do
     read course_name
     read course_sched course_start course_end
     read course_hours
     read course_size
done < $filename

new_course_size=$((course_size + change_amt))

echo "$dept_code $dept_name" > "data/$dept_code$course_num.crs"
echo "$course_name" >> "data/$dept_code$course_num.crs"
echo "$course_sched $course_start $course_end" >> "data/$dept_code$course_num.crs"
echo "$course_hours" >> "data/$dept_code$course_num.crs"
echo "$new_course_size" >> "data/$dept_code$course_num.crs"

echo -e "$(date) ENROLLMENT: $dept_code $course_num $course_name\nchanged by $change_amt" >> "data/queries.log"
