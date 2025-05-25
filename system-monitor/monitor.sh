#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
TITLE="System Monitor"
MENU="Choose one of the following options:"

#1 Show CPU Usage
#2. Show Memory Usage
#3. Show Disk Usage
#4. Show Running Processes
#5. Show Network Stats
#6. Show System Uptime
#7. Show System Temperature
#8. Show All Stats (Summary View)
#9. Exit


OPTIONS=(1 "Show CPU Usage"
         2 "Show Memory Usage"
         3 "Show Disk Usage"
         4 "Show Running Processes"
	 5 "Show Network Stats"
	 6 "Show System Uptime"
	 7 "Show System Temperature"
	 8 "Show All Stats (Summary View)"
	 9 "Exit"
)

CHOICE=$(dialog --clear \
                --backtitle "Linux Shell Project" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
    1)
        echo "CPU USAGE:"
        mpstat
        ;;
    2)
        echo "MEMORY USAGE:"
        free -h
        ;;
    3)
        echo "DISK USAGE:"
        df -h
        ;;
    4)
        echo "Show Running Processes"
        ps
        ;;
    5)
        echo "Show Network Stats"
        nstat
        ;;
    6)
        echo "Show System Uptime"
        uptime
        ;;
    7)
        echo "Show System Temperature"
        sensors
        ;;
    8)
        echo "Show All Stats (Summary View)"
        stat -f /
        ;;
    9)
        echo "Bye!"
        exit 0
        ;;
esac

