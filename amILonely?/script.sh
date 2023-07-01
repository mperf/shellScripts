#!/bin/bash

hosts=("ip_1" "ip_2" "ip_3")
file_path="./check.txt"
expected_word="yes"
log_file="./logs.txt"

# Function to log messages with date
log_message() {
    local message=$1
    echo "$(date): $message" >> "$log_file"
}

# Clear the log file
echo "" > "$log_file"

# check 5 times if the 3 hosts are up
for h in "${hosts[@]}"
do
    ping -c 5 $h > /dev/null
    if [ $? -eq 0 ]; then
        log_message "$h responded"
        exit 0
    fi
done

#check if the expected word match
if [[ -f "$file_path" ]]; then
    if grep -q "\<$expected_word\>" "$file_path"; then
        log_message "proceeds to poweroff"
        sudo poweroff
    else
        log_message "maintenance mode on"
    fi
else
    log_message "file error, proceeds to poweroff anyway"
    sudo poweroff
fi
