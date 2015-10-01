#!/bin/bash

LOG_DIR=/home/robert/irc-logger/logs

echo "Update markdown files"
for log in `find $LOG_DIR`; do
	filename=$(basename "$log")
	extension="${filename##*.}"
	filename="${filename%.*}"
	if [ "$extension" = "log" ]; then
		TARGET="_posts/$filename-logs.markdown"
		echo "---" > $TARGET
		echo "layout: post" >> $TARGET
		echo "title:  \"IRC Logs of $filename\"" >> $TARGET
		echo "date:   $filename 01:52:14" >> $TARGET
		echo "categories: irc logs" >> $TARGET
		echo "---" >> $TARGET
		cat $log >> $TARGET
		echo "updated $filename"
	fi
done

git add _posts
NOW=`date`
git commit -am "Update of the logs on $NOW"
git push

