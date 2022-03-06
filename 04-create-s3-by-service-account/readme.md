### Get FOLDER_ID
```
FOLDER_ID=$(yc config get folder-id)
```
### Create service-account
```
yc iam service-account create --name s3admin
```

### Get id of service-account
```
SA_ID=$(yc iam service-account get --name s3admin --format json | jq .id -r)
```

### Assign a role to the s3admin service account using its ID:
```
yc resource-manager folder add-access-binding --id $FOLDER_ID --role storage.admin --subject serviceAccount:$SA_ID
```

### Create an access key for the s3admin service account:
```
yc iam access-key create --service-account-name s3admin
```
Output:
```
access_key:
  ...
  key_id: KEY_ID
secret: SECRET
```

### To configure the AWS CLI, use the aws configure command. 
```
aws configure
AWS Access Key ID [None]: KEY_ID
AWS Secret Access Key [None]: SECRET
Default region name [None]: ru-central1
Default output format [None]:
```

### Creating a bucket
```
aws --endpoint-url=https://storage.yandexcloud.net s3 mb s3://bucketname
```

### Copy a single file from the local system to cloud-based AWS S3 Buckets
```
aws --endpoint-url=https://storage.yandexcloud.net s3 cp test.txt s3://bucketname
```

### List only the Filenames of an S3 Bucket
```
aws --endpoint-url=https://storage.yandexcloud.net  s3api list-objects --bucket bucketname --output text --query "Contents[].{Key: Key}"
```

Links:
 - 