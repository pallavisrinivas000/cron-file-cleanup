#!/bin/bash

# This scripts deletes the .dmg files from /downloads location that are older than 30 days.

# find the current path where you are in .

current_path=$(pwd)

dmg_path="/Users/pallavi/Downloads"

if [ "$current_path" != "$dmg_path" ]; then
    echo "Changing the directory to $dmg_path"
    cd "$dmg_path" || { echo "failed to change directory"; exit 1; }
else
    echo "Already in the $dmg_path, no need to change directories"
fi 

# find all the dmg files in downloads path

files_to_delete=$(find . -type f \( -name "*.dmg" -o -name "*.ica" -o -name "*.crdownload" \))

if [ -z "$files_to_delete" ]; then
    echo "There are no dmg files to delete"
else
    echo "Proceeding to check the last modified time of the files=$files_to_delete"
fi 

# If there are dmg files in the path, we check whether the files last modified date is greater than 7 days
# If true, we check the file permissions 
# If no write permissions, we change the permissions and delete them.

IFS=$'\n' # Internal Field seperator to deal with file names that has spaces.
# Iterate through each file in files_to_delete
for file in $files_to_delete; do
    # get the last modified time of the file
    last_modified_time=$(stat -f "%z" "$file")
    echo "Last modified time is: $last_modified_time"

    current_date=$(date +%s)
    echo "Current date is : $current_date"

    time_diff=$((current_date - last_modified_time))
    echo "The time difference is : $time_diff"

    #check if time_diff is greater than 7 days
    if [ "$time_diff" -gt $((24 * 60 * 60)) ]; then
        #check if we have write permissions to delete the file
        if [ -w "$file" ] && [ -x "$file" ]; then
            echo "Deleting the file: $file"
            rm $file
        else
            echo "Changing permissions to file to delete"
            chmod +w "$file"
            chmod +x "$file"
            echo "Deleting the file: $file"
            rm "$file"
        fi
    else
        echo "The file is not older than 30 days, skipping the delete process" 
    fi
done



