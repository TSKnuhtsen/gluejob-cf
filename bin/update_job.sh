#!/usr/bin/env bash

aws cloudformation deploy \
    --region us-east-1 \
    --stack-name gluejob \
    --template-file ./stack_job/stack.yaml \
    --parameter-overrides file://stack_job/params.json \
    --capabilities CAPABILITY_NAMED_IAM
