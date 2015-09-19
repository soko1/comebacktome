#!/bin/sh

#
# Licence: BSD
# (C) 2015 Sakalou Aliaksei <nullbsd at gmail dot com>
#

#
# COME BACK TO ME
#
# The script creates a database dump, encrypts it,
# records changes to files and sends it to the git-repository.
# This version for wordpress.
#

GPG_PASS="YOUR_PASSWORDPHRASE"
DUMP_NAME="dump.sql"
COMMIT_DESC=`date +%Y-%m-%d`
GIT_REMOTE="git@bitbucket.org:username/repo.git"

CONF="wp-config.php"

DB_USER=`grep DB_USER $CONF  | awk '{print $2}' |sed s/\'//g | sed s/\)//g | sed s/\;//g`
DB_PASS=`grep DB_PASSWORD $CONF  | awk '{print $2}' |sed s/\'//g | sed s/\)//g | sed s/\;//g`
DB_HOST=`grep DB_HOST $CONF  | awk '{print $2}' |sed s/\'//g | sed s/\)//g | sed s/\;//g`
DB_NAME=`grep DB_NAME $CONF  | awk '{print $2}' |sed s/\'//g | sed s/\)//g | sed s/\;//g`

if [ ! -d .git ]; then git init; git remote add origin $GIT_REMOTE; fi

if [ -f $DUMP_NAME.gpg ]; then rm -f $DUMP_NAME.gpg; fi

mysqldump -u$DB_USER -p$DB_PASS -h$DB_HOST $DB_NAME | gzip -9c >$DUMP_NAME.gz

gpg -c --passphrase $GPG_PASS $DUMP_NAME.gz
rm -f $DUMP_NAME.gz
git add .
git commit -a -m $COMMIT_DESC
git push
