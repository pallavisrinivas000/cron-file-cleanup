# cron-file-cleanup
A bash script that runs everyday and deletes some unnecessary files using crontab.

# My Learning Notes:
# Bash Script Learning

1. How to initiate a bash script? 
    1. #! /bin/bash
2. How to declare a variable in shell and assign a commands output to it?
    1. variable=$(command)
    2. Please make sure that there is no space on either side on = and the command is always inside a ().
3. How to assign a normal variable ? Just var=”value”
4. How to comment? # this is my comment
5. How to write an if loop?
    1. if [ condition ]; then task else task fi
    2. Note that there should be spaces before condition and [ ]. 
6. || are used to add condition if the given task fails.
7. How to find a file: find $path_from_where_to_delete -type f (for file) -name *.txt
8. How to find multiple file types? 
    1. Just put all types inside a \(). 
    2. find . -type f \(-name *.txt -o (or) -name *.jpg\)
9. inside if loop if we have -z followed by condition, it checks if null or empty. we can also use -n to check if it is non empty
10.  IFS( internal field seperator) : he **`IFS`** variable is used to control the behavior of word splitting, which is how the shell breaks up arguments and input into separate words. In this script, **`IFS=$'\n'`** sets the **`IFS`** to a newline character (**`\n`**).
11. To write a for loop the syntax is : for file in files; do task done

# How to run the crontab file:

crontab crontab_file.txt

To check : crontab -l


# How to improve?

1. Add how much data is being getting free up by this process to monitor the work.
2. Also log all the files that are getting deleted to splunk.
