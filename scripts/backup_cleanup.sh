#! /bin/bash

# Backup and archive

tar -czf backups/project_backup_$(date +%F_%H-%M-%S).tar.gz /home/vagrant/linux-automation-toolkit/scripts/

# Cleanup the backup (Delete old backups older than a set number of days)

find backups/ -type f -name "*.tar.gz" -mtime +1 -delete