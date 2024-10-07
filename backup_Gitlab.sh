#! /bin/bash
###########################
# Backup as GitLab Server
# Created By NavidTsh
# 2024.10.7
###########################

timestamp=$(date +"%Y-%m-%d_%H-%M")

PATH_DIR=/root/gitlab_backup
[ -d $PATH_DIR ] &&  echo "The Directory Is Exsit"  ||  mkdir $PATH_DIR

mkdir $PATH_DIR/$timestamp

cp -r /etc/gitlab $PATH_DIR/$timestamp/

sudo gitlab-backup create
#sudo gitlab-backup create SKIP=db,uploads

mv /var/opt/gitlab/backups/* $PATH_DIR/$timestamp/

echo "Backup Completed"