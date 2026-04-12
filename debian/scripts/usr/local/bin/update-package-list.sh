#!/bin/bash

user='msi'
# Define the full path to ensure the directory exists
log_path="/home/$user/sys-logs/thinkpad/debian/i3"

# Create the directory if it doesn't exist
mkdir -p "$log_path"

# Re-export manually installed packages
aptitude search '~i !~M' -F '%p' | sed 's/ *$//' > "$log_path/packages.txt"

# Fix ownership
chown -R $user:$user "/home/$user/sys-logs"
