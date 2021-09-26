#!/bin/bash
uptime_formated=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)
battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
date_formatted=$(date "+%a %d-%m-%Y 🕔 %H:%M")
pomo=$($HOME/.local/bin/pomo)
echo "↑$uptime_formated 🔋$battery_percent% 🗓️ $date_formatted $pomo"
