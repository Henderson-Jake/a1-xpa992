#!/bin/bash

read -p "Department code: " dept_code
read -p "Department name: " dept_name
read -p "Course number: " course_num 
read -p "Course name: " course_name 
read -p "Scheduled days: " course_sched 
read -p "Course start: " course_start 
read -p "Course end: " course_end 
read -p "Credit hours: " course_hours 
read -p "Enrolled students: " course_size 

dept_code=${dept_code^^}

if [ -f "data/$dept_code$course_num.crs" ]; then
	echo "ERROR: course already exists"
else 
	echo "$dept_code $dept_name" > "data/$dept_code$course_num.crs"
	echo "$course_name" >> "data/$dept_code$course_num.crs"
	echo "$course_sched $course_start $course_end" >> "data/$dept_code$course_num.crs"
	echo "$course_hours" >> "data/$dept_code$course_num.crs"
	echo "$course_size" >> "data/$dept_code$course_num.crs"
fi


echo "$date CREATED: $dept_code $course_num $course_name" >> "data/queries.log"
