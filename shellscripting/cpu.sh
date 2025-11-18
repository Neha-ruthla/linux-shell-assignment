#!/bin/bash
# Purpose : Log CPU and Memory usage at regular intervals
# Name  : neha 
# Date    : 17-11-2025

# Log file location
new_folder="/home/hpneha_sharma/system_usage.log"

# Interval between logs (in seconds)
INTERVAL=5

echo "Starting CPU & Memory Monitoring..."
echo "Logs will be saved in $new_folder"
echo "--------------------------------------" >> "$new_folder"

while true
do
    # Current time
    TIME=$(date +"%Y-%m-%d %H:%M:%S")

    # CPU usage
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2+$4}')

    # Memory usage
    MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

    # Write to log file
    echo "Time: $TIME | CPU: ${CPU}% | Memory: ${MEM}%" >> "$new_folder"

    # Wait for interval
    sleep $INTERVAL
done