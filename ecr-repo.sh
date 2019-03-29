#!/bin/bash

if [ -z "$2" ]
  then
    echo "No region specified. Extracting from AWS EC2 metadata"
    REGION=`curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}'`
else
    REGION="$2"
fi

aws ecr describe-repositories --region $REGION --repository-names $1 2>&1 > /dev/null
status=$?
if [[ ! "${status}" -eq 0 ]]; then
    aws ecr create-repository --region $REGION --repository-name $1
fi
