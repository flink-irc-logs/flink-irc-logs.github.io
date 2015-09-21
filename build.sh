#!/bin/bash

LOG_DIR=/tmp/logs
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
	fi

done