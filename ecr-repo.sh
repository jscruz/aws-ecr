#!/bin/bash
PERMISSIONS_FILE=/tmp/permissions.json

if [ -z "$2" ]
  then
    echo "No region specified. Extracting from AWS EC2 metadata"
    REGION=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}'`
else
    REGION="$2"
fi

if [ -f "$PERMISSIONS_FILE" ]; then
    echo "Permissions file $FILE exists."
fi

echo "Region selected $REGION"
aws ecr describe-repositories --region $REGION --repository-names $1 2>&1 > /dev/null
status=$?
if [[ ! "${status}" -eq 0 ]]; then
    aws ecr create-repository --region $REGION --repository-name $1
    if [ -f "$PERMISSIONS_FILE" ]; then
       aws ecr set-repository-policy --region $REGION --repository-name $1 --policy-text "file://$PERMISSIONS_FILE"
    fi
else
    echo "ECR Repository $1 already exists"
fi
