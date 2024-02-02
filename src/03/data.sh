#!/bin/bash

data=("HOSTNAME = $(hostname | awk -F '-' '{print $1}')"
      "TIMEZONE = $(timedatectl show -p Timezone --value) $(date +%Z)"
      "USER = $(whoami)"
      "OS = $(lsb_release -d -s)"
      "DATE = $(date +"%d %b %Y %H:%M:%S")"
      "UPTIME = $(uptime -p)"
      "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
      "IP = $(ip -4 -o addr show scope global | awk '{print $4}' | cut -d/ -f1)"
      "MASK = $(ip -4 -o addr show scope global | awk '{print $4}' | cut -d/ -f2)"
      "GATEWAY = $(ip route | grep default | awk '{print $3}')"
      "RAM_TOTAL = $(free -h --si | awk 'NR==2 {print $2}') GB"
      "RAM_USED = $(free -h --si | awk 'NR==2 {print $3}')"
      "RAM_FREE = $(free -h --si | awk 'NR==2 {print $4}')"
      "SPACE_ROOT = $(df -BM / | awk 'NR==2 {print $2}') MB"
      "SPACE_ROOT_USED = $(df -BM / | awk 'NR==2 {print $3}') MB"
      "SPACE_ROOT_FREE = $(df -BM / | awk 'NR==2 {print $4}') MB")

