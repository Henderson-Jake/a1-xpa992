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

filename="data/$dept_code$course_num.crs"

if [ ! -r "$filename" ]; then
	echo "ERROR: course not found"
	exit 1
fi

read -r orig_dept_code orig_dept_name < $filename

while IFS= read -r line; do
    # read orig_dept_code orig_dept_name
     read orig_course_name
     read orig_course_sched orig_course_start orig_course_end
     read orig_course_hours
     read orig_course_size
done < $filename


if [ -z "$dept_name" ]; then
    dept_name="$orig_dept_name"
fi

if [ -z "$course_name" ]; then
    course_name="$orig_course_name"
fi

if [ -z "$course_sched" ]; then
    course_sched="$orig_course_sched"
fi

if [ -z "$course_start" ]; then
    course_start="$orig_course_start"
fi

if [ -z "$course_end" ]; then
    course_end="$orig_course_end"
fi

if [ -z "$course_hours" ]; then
    course_hours="$orig_course_hours"
fi

if [ -z "$course_size" ]; then
    course_size="$orig_course_size"
fi

echo "$dept_code $dept_name" > "data/$dept_code$course_num.crs"
echo "$course_name" >> "data/$dept_code$course_num.crs"
echo "$course_sched $course_start $course_end" >> "data/$dept_code$course_num.crs"
echo "$course_hours" >> "data/$dept_code$course_num.crs"
echo "$course_size" >> "data/$dept_code$course_num.crs"


date=$(date)

echo "$date UPDATED: $dept_code $course_num $course_name" >> "data/queries.log"
