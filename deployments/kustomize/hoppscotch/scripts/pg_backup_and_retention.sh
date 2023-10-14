#!/bin/bash

# Variables
BACKUP_DIR="/backups"
CURRENT_DATE=$(date +"%Y-%m-%d_%H%M%S")
DUMP_FILE_NAME="backupOn${CURRENT_DATE}.dump"
FULL_PATH="${BACKUP_DIR}/${DUMP_FILE_NAME}"
LOG_FILE="${BACKUP_DIR}/backup_log.log"
RETENTION_DAYS=180

# Check if BACKUP_DIR exists, if not create it
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p $BACKUP_DIR
fi

# Redirect stdout and stderr to the log file for detailed logging
exec >> $LOG_FILE 2>&1

# Function to log messages
log_message() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

# Trap to print log contents when script exits
trap 'cat $LOG_FILE' EXIT

# Print Environment Variables (excluding password for security)
log_message "DB_ADDR: $DB_ADDR"
log_message "DB_USER: $DB_USER"
log_message "DB_DATABASE: $DB_DATABASE"

# Test Database Connectivity
log_message "Testing port connectivity to $DB_ADDR:5432 using 'nc'"
nc -zv $DB_ADDR 5432
if [ $? -ne 0 ]; then
    log_message "Port connectivity test to $DB_ADDR:5432 failed. Exiting."
    exit 1
fi

log_message "Starting backup process."

# Set the PostgreSQL password for the pg_dump command
export PGPASSWORD=$DB_PASSWORD

# Create the PostgreSQL backup
pg_dump -h $DB_ADDR -p 5432 -U $DB_USER -d $DB_DATABASE -F c --blobs > $FULL_PATH
if [ $? -ne 0 ]; then
    log_message "Backup failed for $DUMP_FILE_NAME. Removing incomplete dump file."
    rm -f $FULL_PATH
    exit 1
fi

log_message "Successfully created backup: $DUMP_FILE_NAME"

# Implement the retention policy
find $BACKUP_DIR -type f -name "*.dump" -mtime +$RETENTION_DAYS -exec rm -f {} \;
if [ $? -eq 0 ]; then
    log_message "Old backups older than $RETENTION_DAYS days have been removed."
else
    log_message "Error while trying to remove old backups. Manual intervention might be required."
fi

log_message "Backup process completed."

exit 0
