#! /bin/bash

# Author: Amit Narayan
# Date: 2022-02-20
# Purpose: This script will system monitoring information and generate report.
# Usage: ./system_monitoring.sh
# Version: 1.0

report_file="system_monitoring_report_D$(date '+%Y-%m-%d')_T$(date '+%H:%M:%S').txt"

#cpu report start
current_cpu=$(top -b -n1 | head -n 3 | tail -n 1 | awk -F: '{print $2}') 
echo $current_cpu
us=$(awk -F, '{print $1}' <<< $current_cpu | awk '{print $1}')
sy=$(awk -F, '{print $2}' <<< $current_cpu | awk '{print $1}')
ni=$(awk -F, '{print $3}' <<< $current_cpu | awk '{print $1}')
id=$(awk -F, '{print $4}' <<< $current_cpu | awk '{print $1}')
wa=$(awk -F, '{print $5}' <<< $current_cpu | awk '{print $1}')
hi=$(awk -F, '{print $6}' <<< $current_cpu | awk '{print $1}')
si=$(awk -F, '{print $7}' <<< $current_cpu | awk '{print $1}')
st=$(awk -F, '{print $8}' <<< $current_cpu | awk '{print $1}')
#cpu report end

#memory report start
current_memory=$( top -b -n1 | head -4 | tail -1)
tm=$(awk '{print $4}' <<< $current_memory)
fm=$(awk '{print $6}' <<< $current_memory)
um=$(awk '{print $8}' <<< $current_memory)
cbm=$(awk '{print $10}' <<< $current_memory)
#memory report end

#disk report start

#disk report end


 

{
    echo "+=============================================================+"
    echo "|                     System monitoring                       |"
    echo "+=============================================================+"
    echo "| Date: $(date '+%Y-%m-%d') Time: $(date '+%H:%M:%S')                             |"
    echo "+=============================================================+"
    echo "|  CPU usage ($(echo "100 - $id" | bc)%)                                           |"
    echo "+------------------------------+------------------------------+"
    echo "|  user CPU time               | $us%                         |"
    echo "|  System CPU time             | $sy%                         |"
    echo "|  Nice CPU time               | $ni%                         |"
    echo "|  Idle CPU time               | $id%                        |"
    echo "|  I/O Wait time               | $wa%                         |"
    echo "|  Hardware Interrupt time     | $hi%                         |"
    echo "|  Software Interrupt time     | $si%                         |"
    echo "|  Steal time                  | $st%                         |"
    echo "+=============================================================+"
    echo "|  Memory usage                                               |"
    echo "+------------------------------+------------------------------+"
    echo "| Total memory                 | $tm                       |"
    echo "| Free memory                  | $fm                       |"
    echo "| Used memory                  | $um                       |"
    echo "| Cache/Buff memory            | $cbm                       |"
    echo "+=============================================================+"
    echo "|  Disk usage                                                 |"
    echo "+------------------------------+------------------------------+"
    df -h
    echo "+=============================================================+"
} | tee $report_file

