
import awswrangler as wr
import pandas as pd
import boto3


boto3.setup_default_session(region_name="us-east-1")

s3_path="s3://test-data-lake-ftg321/customer_info2/"

df = wr.s3.read_parquet(s3_path, dataset=True)

print(df.head())