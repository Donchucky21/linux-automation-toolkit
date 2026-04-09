#! /bin/bash

#This script runs some system information

echo "Hostname is: $HOSTNAME"
echo "Date is: $(date)"


# echo "CPU is: $(lscpu)"
# echo "Ram is: $(free -h)"
# echo "Disk usage is: $(df -h)"
# ip a

echo ""
echo "CPU:"
lscpu | grep -E "Model name|CPU\(s\)|Architecture"

echo ""
echo "Memory:"
free -h | awk 'NR==2{print "Total: "$2", Used: "$3", Free: "$4}'

echo ""
echo "Disk:"
df -h / | awk 'NR==2{print "Filesystem: "$1", Size: "$2", Used: "$3", Avail: "$4", Usage: "$5}'

echo ""
echo "Network:"
ip -4 addr show | grep inet | grep -v 127.0.0.1