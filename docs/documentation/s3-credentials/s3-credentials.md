# Using your temporary AWS S3 credentials

This page explains how to use the temporary S3 credentials provided by our platform. Whether you prefer the command line or a bit of Python, we’ve included examples to help you get started quickly.

## Generating Your Temporary Credentials

1. Log in to your account.
2. Click on the Workspaces tab at the top.
3. Select the Credentials tab.
4. Click on the S3 Token sub-tab.
5. Finally, click the Request Temporary AWS S3 Credentials button. A popup similar to the one below will appear:

![](../../assets/doc_s3_s1.png)

```bash
Access Key ID: e.g. ASIATNVEVXXXXX
Secret Access Key: e.g. eeLV8XXXXX
Session Token: e.g. IQoJb3JpZXXXXX
Expiration: e.g. 2025-02-18 16:17:54 +0000 UTC
```

!!! warning
    These credentials are temporary. Make sure you generate new ones if the current credentials expire.

## Understanding Your Credentials

* Access Key ID & Secret Access Key: These work together as your username and password for accessing your S3 bucket.
* Session Token: This is an extra security token needed to verify your session.
* Expiration: This tells you when the credentials will no longer be valid.

Remember, you’ll need all three items when connecting to S3.

## Using the AWS CLI

If you haven’t already, please install the AWS CLI. Then, set your credentials in your shell session:

```bash
export AWS_ACCESS_KEY_ID="ASIATNVEVXXXXX"
export AWS_SECRET_ACCESS_KEY="eeLV8XXXXX"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEGgaCWV1LXdlc3XXX"
```

You can then list the contents of your S3 bucket (replace your-bucket-name with the actual bucket name):

```bash
aws s3 ls s3://bucket-name/workspace-name/
```

The bucket name depends on the environment of EODH DataHub you are using. For production, it is workspaces-eodhp.

```bash
aws s3 ls s3://workspaces-eodhp/james-workspace/
```

## Using the s3cmd tool

If you prefer using `s3cmd`, you can configure it using your temporary credentials:

Run the configuration command:

```bash
s3cmd --configure
```

When prompted, enter your Access Key, Secret Key, and Session Token as required. To list your bucket contents, use:

```bash
s3cmd ls s3://your-bucket-name/
```

Similar to the above, if I was using the EODH Production environment and my Workspace name was james-workspace the command would be

```bash
s3cmd ls s3://workspaces-eodhp/james-workspace/
```

## Using Your Credentials in Python

For those who prefer to work in Python, the boto3 library is the easiest way to interact with S3. If you don’t have it installed, you can install it with:

```py
pip install boto3
```

Here’s a short script that lists the objects in your bucket:

```py
import boto3
# Initialise the S3 client with your temporary credentials
s3 = boto3.client(
    's3',
    aws_access_key_id='ASIATNVEVXXXXX',
    aws_secret_access_key='eeLV8XXXXX',
    aws_session_token='IQoJb3JpZ2luX2VjEGgaCWV1LXdlc3XXX'
)

bucket_name = 'workspaces-eodhp'

# List objects in the bucket
response = s3.list_objects_v2(Bucket=bucket_name, Prefix="YOUR-WORKSPACE-NAME") # e.g. james-workspace

if 'Contents' in response:
    for obj in response['Contents']:
        print(obj['Key'])
else:
    print("No objects found in the bucket.")
```

!!! tip
    For more detailed instructions and advanced use cases, please visit our Help Page on S3 Credentials. This page covers additional topics like copying files between buckets and troubleshooting common issues.