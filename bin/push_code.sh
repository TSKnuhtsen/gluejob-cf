#!/usr/bin/env bash

STACK_NAME="gluecode-bootstrap"
REGION="us-east-1"

code_bucket=$(aws --region $REGION --output json cloudformation describe-stacks --stack-name "${STACK_NAME}" \
    | jq -r '.Stacks[0].Outputs[] | select(.OutputKey=="CodeBucketName") | .OutputValue')

echo "S3 Code Bucket Name: ${code_bucket}"

aws s3 cp ./job_code/main.py "s3://${code_bucket}/code/"