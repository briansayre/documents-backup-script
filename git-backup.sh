#!/bin/bash

# Change to the documents directory
cd /
cd /home/brian/Documents

# Get the log date from git and current date
DATE=$(date +'%d')
LOGDATE=$(git log master | awk 'FNR == 3 {print $4; exit}')
LOGDATE=20
# Testing
#echo Variables
#echo $DATE
#echo $LOGDATE
#echo -------

# Push new changes to the repo if needed
if [ "$LOGDATE" == "$DATE" ]; then
    
    printf  '~~~~~~~ Documents Backup ~~~~~~~\n'
    printf  '~~  No backup needed          ~~\n'
    printf  '~~  Current date: %s          ~~\n' "$DATE"
    printf  '~~  Last backup date: %s      ~~\n' "$LOGDATE"
    printf  '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n'
    
else

    printf  '~~~~~~~ Documents Backup ~~~~~~~\n'
    printf  '~~  Backup needed             ~~\n'
    printf  '~~  Current date: %s          ~~\n' "$DATE"
    printf  '~~  Last backup date: %s      ~~\n' "$LOGDATE"
    printf  '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n'
    printf  '\n'
    printf  'Starting backup...\n\n'

    git add .
    git commit -m "Auto backup"
    git push origin master

    printf  '\nBackup complete\n\n'

fi