#!/usr/bin/env bash

aws cloudformation create-stack \
    --region us-east-1 \
    --stack-name gluejob \
    --template-body file://stack_job/stack.yaml \
    --parameters file://stack_job/params.json \
    --capabilities CAPABILITY_NAMED_IAM