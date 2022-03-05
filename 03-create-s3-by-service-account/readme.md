### Get FOLDER_ID
```
FOLDER_ID=$(yc config get folder-id)
```
### Create service-account
```
yc iam service-account create --name s3editor
```

### Get id of service-account
```
SA_ID=$(yc iam service-account get --name s3editor --format json | jq .id -r)
```

### Assign a role to the s3editor service account using its ID:
```
yc resource-manager folder add-access-binding --id $FOLDER_ID --role storage.admin --subject serviceAccount:$SA_ID
```

### Create an access key for the s3editor service account:
```
yc iam access-key create --service-account-name s3editor
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