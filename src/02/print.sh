#!/bin/bash
print() {
output=$(cat <<EOF
HOSTNAME = $(hostname | awk -F'-' '{print $1}')
TIMEZONE = $(timedatectl show -p Timezone --value) $(date +%Z)
USER = $(whoami)
OS = $(lsb_release -d -s)
DATE = $(date +"%d %B %Y %T")
UPTIME = $(uptime -p)
UPTIME_SEC = $(awk '{print $1}' /proc/uptime)
IP = $(hostname -I | awk '{print $1}')
MASK = $(ifconfig | grep -A 1 'inet ' | tail -1 | awk '{print $4}')
GATEWAY = $(ip route | grep default | awk '{print $3}')
RAM_TOTAL = $(free -h | grep -i "mem" | awk '{printf("%.3f", $4)}')
RAM_USED = $(free -h --si | awk 'NR==2 {print $3}')
RAM_FREE = $(free -h --si | awk 'NR==2 {print $4}')
EOF
)
echo "$output"
}
