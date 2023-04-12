#!/usr/bin/env bash

aws cloudformation delete-stack \
    --region us-east-1 \
    --stack-name gluejob
