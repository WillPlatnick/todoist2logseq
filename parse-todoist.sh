#!/bin/bash

# Add any tags you want to auto append
ADD_TAG=""

# Move emails that Sparks add to today's list of stuff
PARSE_SPARK=1

# Default Filters
DEFAULT_FILTER="(today | overdue)"
DEFAULT_SPARK_FILTER="(today | overdue)"

# If you want to ignore tasks with a specific time, set this to 1
# Does not include parsed emails
IGNORE_TIME=1

/usr/local/bin/todoist sync

if [[ $PARSE_SPARK -eq 1 ]]; then
  while IFS=, read -r id priority date project labels title
  do
    complete=0
    url=$(/usr/local/bin/todoist show $id | grep ^URL | grep -o 'readdlespark://[^"]*') 
    newtitle=$(echo $title | sed 's/(Open email in spark)//i' | sed 's/\[//i' | sed 's/\]//i')     
    echo "### TODO $newtitle [Open email in spark]($url) $project $ADD_TAG"
    /usr/local/bin/todoist close $id
  done < <(/usr/local/bin/todoist --csv list --filter "$DEFAULT_SPARK_FILTER" | grep 'Open email in Spark')
fi


while IFS=, read -r id priority date project labels title
do
    complete=0
    if [[ $IGNORE_TIME -eq 1 ]]; then
      if echo $date | grep 00:00 > /dev/null; then
        echo "### TODO $title $project $ADD_TAG"
        /usr/local/bin/todoist close $id
      fi
    fi
done < <(/usr/local/bin/todoist --csv list --filter "$DEFAULT_FILTER")

