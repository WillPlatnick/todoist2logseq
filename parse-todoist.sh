#!/bin/bash

# Add any tags you want to auto append
ADD_TAG=""

# If you want to ignore tasks with a specific time, set this to 1
IGNORE_TIME=1

/usr/local/bin/todoist sync

while IFS=, read -r id priority date project labels title
do
    complete=0
    if [[ $IGNORE_TIME -eq 1 ]]; then
      if echo $date | grep 00:00 > /dev/null; then
        echo "{{[[TODO]]}} $title $project $ADD_TAG"
        /usr/local/bin/todoist close $id
      fi
    fi
done < <(/usr/local/bin/todoist --csv list --filter 'today' | grep -v 'in Spark')

