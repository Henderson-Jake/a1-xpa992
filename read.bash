#!/bin/bash

read -p "Enter department code and course number: " dept_code course_num

filename="data/dept_code$course_num.crs"

if [ -r "data/$filename" ]; then

read_courses() {
	read dept_code dept_name
	read course_name
	read course_sched course_start course_end
	read course_hours
	read course_size
	echo "Course department: $dept_code $dept_name"
	echo "Course number: $course_num"
	echo "Course name: $course_name"
	echo "Scheduled days: $course_sched"
	echo "Course start: $course_start"
	echo "Course end: $course_end"
	echo "Credit hours: $course_hours"
	echo "Enrolled Students: $course_size"
}

else
	echo "could not read that file"
	exit 1
fi
read_courses < $filename
