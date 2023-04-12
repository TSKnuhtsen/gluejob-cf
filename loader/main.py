
import awswrangler as wr
import pandas as pd
import boto3

boto3.setup_default_session(region_name="us-east-1")

s3_path="s3://test-data-zuu553/raw/customer_db/customer_info/"

df = pd.read_csv('./sample_data/customer.csv')

df['year'] = '2022'
df['month'] = '11'
df['day'] = '03'

wr.s3.to_csv(
    df=df,
    path=s3_path,
    dataset=True,
    index=False,
    partition_cols=['year', 'month', 'day'],
    mode="overwrite",
    s3_additional_kwargs={
        'StorageClass': 'INTELLIGENT_TIERING'
    },
    database="datasource",
    table="customer"
)
                    