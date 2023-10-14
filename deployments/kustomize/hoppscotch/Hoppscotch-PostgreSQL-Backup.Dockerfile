# Postgres image
FROM postgres:16.0

# Install netcat-openbsd
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Create a directory for backups
RUN mkdir -p /backups

# Copy the backup script into the container
COPY scripts/pg_backup_and_retention.sh /pg_backup_and_retention.sh

# Make the script executable
RUN chmod +x /pg_backup_and_retention.sh

# Set default command to run the backup script using /bin/bash
ENTRYPOINT [ "/bin/bash" ]
CMD [ "/pg_backup_and_retention.sh" ]
