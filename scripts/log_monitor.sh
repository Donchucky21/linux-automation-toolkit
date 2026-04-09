#!/bin/bash

LOG_FILE="/home/vagrant/linux-automation-toolkit/logs/test_access.log"
ALERT_EMAIL="donchucky21@gmail.com"

echo "Monitoring $LOG_FILE for HTTP 500 errors..."
echo "Press Ctrl+C to stop."

tail -Fn0 "$LOG_FILE" | while read -r line
do
  if echo "$line" | grep -q " 500 "; then
    echo "ALERT: HTTP 500 detected!"
    echo "$line"
    echo "HTTP 500 detected in log: $line" | mail -s "HTTP 500 Alert" "$ALERT_EMAIL"
  fi
done



# #! /bin/bash

# # This script should:

# # Continuously watch a web log file such as:
# # /var/log/nginx/access.log
# # Detect lines containing 500
# # Print an alert
# # Send an email alert

# tail -Fn0 /home/vagrant/linux-automation-toolkit/logs/test_access.log | while read -r line
# do
#   if echo "$line" | grep -q " 500 "; then
#     echo "ALERT: HTTP 500 detected!"
#     echo "$line"
#   fi
# done

# echo "HTTP 500 detected in web log" | mail -s "Log Alert" donchucky21@gmail.com