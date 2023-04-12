#!/usr/bin/env bash

STACK_NAME="gluecode-bootstrap"
REGION="us-east-1"

aws cloudformation create-stack \
    --region $REGION \
    --stack-name $STACK_NAME \
    --template-body file://stack_bootstrap/stack.yaml \
    --parameters file://stack_bootstrap/params.json

aws --region $REGION cloudformation wait stack-create-complete --stack-name $STACK_NAME