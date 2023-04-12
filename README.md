# gluejob-cf

## Directory Structure

1. bin - helper utilities written in bash
* ```bootstrap.sh``` - create bootstrap cf stack based in stack_bootstrap folder
* ```create_job.sh``` - initial aws glue job cf stack creation
* ```delete_job.sh``` - deletes aws glue job cf stack
* ```push_code.sh``` - push aws glue pyspark code to s3 bucket for later usage.
* ```update_job.sh``` - if there any changes to stack_job folder template or parameters it will redeploy cf stack.
2. job_code - aws glue pyspark code which is uploaded to s3 bucket
* ```main.py``` - source code of pyspark code which reads from glue data catalog table and writes output to s3 in parquet file format.
3. loader - test data upload python tool. writes csv to s3 with aws glue data catalog metadata with aws wrangler
* ```sample_data``` - contains sample dataset
* ```main.py``` - source code that writes test data to s3 and glue data catalog
* poetry and pyenv files - python version manager and python dependency manager.
4. stack_bootstrap - cf stack template with parameters to bootstrap main stack located in stack_job folder. it creates glue code s3 bucket, aws glue database for table.
* ```paramas.json``` - parameter files used in create of cf stack.
* ```stack.yaml``` - cf template file
5. stack_job - main cf template which creates glue job. can eb updated if config changes.
* ```paramas.json``` - parameter files used in create or update of cf stack.
* ```stack.yaml``` - cf template file
6. tester - testing utility of test data set to check output of parquet files. only usable for small datasets because limited by local device memory size to fit data but reads whole data set and all partitions.
* ```main.py``` - source code which reads test parquet data from s3.
* poetry and pyenv files - python version manager and python dependency manager.

## Local env dependencies

1. aws cli
2. jq
3. python 3.10
4. pip 
5. poetry

## Steps to Create Local Env

1. ```./bin/bootstrap.sh```
2. ```cd loader; poetry run python main.py```
3. ```./bin/push_code.sh```
4. ```./bin/create_job.sh```
6. ```./bin/update_job.sh```
7. run glue job in console or aws cli
8. use tester with ```cd tester; poetry run python main.py```
9. ```./bin/delete_job.sh```
