#!/bin/bash

# Check if the file name is provided as an argument
if [ $# -eq 0 ]
  then
    echo "Please provide a file name as an argument"
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]
  then
    echo "File does not exist"
    exit 1
fi

# Create a temporary file to store the first 3 lines
temp_file=$(mktemp)

# Copy the first 3 lines to the temporary file
head -n 3 $1 > $temp_file

# Overwrite the original file with the first 3 lines
mv $temp_file $1

echo "All lines in the file except the first 3 have been deleted"

