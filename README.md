# Linux Automation Toolkit

## Overview
This project is a small Linux automation toolkit built for day-to-day DevOps operations. It includes scripts for gathering system information, creating automated backups with cleanup, and monitoring logs for HTTP 500 errors with email alerts.

## Project Goal
Build essential Linux automation scripts that can be used in real-world operational tasks.

## Deliverables
- System information script
- Automated backup and disk cleanup script
- Real-time log monitor for HTTP 500 errors with email alert
- README with usage examples
- Demo screenshots / terminal outputs

## Project Structure
```bash
linux-automation-toolkit/
├── backups/
├── logs/
│   └── test_access.log
├── scripts/
│   ├── system_info.sh
│   ├── backup_cleanup.sh
│   └── log_monitor.sh
└── README.md

Scripts
1. system_info.sh

This script displays key system details such as:

Hostname
Date and time
Uptime
CPU information
Memory usage
Disk usage
Network IP address


2. backup_cleanup.sh

This script:

Creates a compressed backup of the project directory
Saves the backup in the backups/ folder
Removes old backup files older than 7 days
3. log_monitor.sh

This script:

Monitors a log file in real time
Detects HTTP 500 errors
Prints an alert to the terminal
Sends an email notification when a 500 error is detected
Prerequisites

Make sure the following are installed:

Bash
tar
cron
mailutils
msmtp
msmtp-mta

Install required packages:

sudo apt update
sudo apt install -y mailutils msmtp msmtp-mta ca-certificates
Email Configuration

To send real email alerts, Gmail SMTP was configured using msmtp.

Create the config file:

nano ~/.msmtprc

Add:

defaults
auth           on
tls            on
tls_starttls   on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        ~/.msmtp.log

account        gmail
host           smtp.gmail.com
port           587
from           your email
user           your email
password       YOUR_16_DIGIT_APP_PASSWORD

account default : gmail

Secure the file:

chmod 600 ~/.msmtprc
Usage
Make scripts executable
chmod +x scripts/system_info.sh
chmod +x scripts/backup_cleanup.sh
chmod +x scripts/log_monitor.sh

Run system information script
./scripts/system_info.sh
Run backup and cleanup script
./scripts/backup_cleanup.sh

Check backup files
ls -lh backups/
Run log monitor
./scripts/log_monitor.sh
Simulate a HTTP 500 error

Open another terminal and run:

echo '127.0.0.1 - - [09/Apr/2026:20:20:00 +0000] "GET /error HTTP/1.1" 500 612' >> /home/vagrant/linux-automation-toolkit/logs/test_access.log
Cron Setup

The backup script is cron-ready and can be scheduled to run automatically.

Open crontab:

crontab -e

Example cron job to run daily at 2 AM:

0 2 * * * /home/vagrant/linux-automation-toolkit/scripts/backup_cleanup.sh >> /home/vagrant/linux-automation-toolkit/logs/backup.log 2>&1

Check cron jobs:

crontab -l
Sample Output
system_info.sh
Hostname: ubuntu-focal
Date: Thu Apr 9 19:34:31 UTC 2026
Uptime: up 2 hours

CPU:
Architecture: x86_64
CPU(s): 2
Model name: Intel(R) Core(TM) i7-8665U CPU @ 1.90GHz

Memory:
Total: 3.8Gi, Used: 511Mi, Free: 1.7Gi

Disk:
Filesystem: /dev/sda1, Size: 39G, Used: 16G, Avail: 24G, Usage: 40%

Network:
inet 10.0.2.15/24
backup_cleanup.sh
Backup completed: /home/vagrant/linux-automation-toolkit/backups/project_backup_2026-04-09_20-00-00.tar.gz
log_monitor.sh
Monitoring /home/vagrant/linux-automation-toolkit/logs/test_access.log for HTTP 500 errors...
Press Ctrl+C to stop.

ALERT: HTTP 500 detected!
127.0.0.1 - - [09/Apr/2026:20:20:00 +0000] "GET /error HTTP/1.1" 500 612
Demo Evidence

The following evidence was collected for the project:

Output of system_info.sh
Successful backup creation in backups/
Cron job entry from crontab -l
Log monitor detecting a simulated HTTP 500 error
Delivered email alert from the VM to Gmail inbox
Challenges and Fixes

During the project:

Nginx was not installed, so a test log file was created instead of using /var/log/nginx/access.log
Gmail SMTP had to be configured using msmtp and a Google App Password to enable real email delivery
The backup script was updated to use correct paths and cleaner tar formatting
Learning Outcome

This project helped demonstrate practical Linux automation skills including:

Shell scripting with Bash
File compression and cleanup
Scheduling with cron
Log monitoring in real time
SMTP email alerting from a Linux VM
Author

Chukwuka Agupugo