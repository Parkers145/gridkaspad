#!/bin/bash

# Define the log file
LOG_FILE="/var/log/kaspad_run.log"

# Function to log messages
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Change directory to /usr/local/bin
cd /usr/local/bin
if [ $? -ne 0 ]; then
    log_message "ERROR: Failed to change directory to /usr/local/bin"
    exit 1
fi
log_message "INFO: Changed directory to /usr/local/bin"

# Run the kaspad command with the --utxoindex flag
./kaspad --utxoindex
if [ $? -ne 0 ]; then
    log_message "ERROR: Failed to execute ./kaspad --utxoindex"
    exit 1
fi

log_message "INFO: kaspad executed successfully with --utxoindex"
