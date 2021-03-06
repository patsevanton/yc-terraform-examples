### Get FOLDER_ID
```
FOLDER_ID=$(yc config get folder-id)
```
### Create service-account
```
yc iam service-account create --name s3admin
```

### Get id of service-account s3admin
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
aws --endpoint-url=https://storage.yandexcloud.net s3 mb s3://test-bucket-anton-patsev
```

### Enable versioning S3
```
aws --endpoint-url=https://storage.yandexcloud.net s3api put-bucket-versioning --bucket test-bucket-anton-patsev --versioning-configuration MFADelete=Disabled,Status=Enabled
```

### Check versioning S3
```
aws --endpoint-url=https://storage.yandexcloud.net s3api get-bucket-versioning --bucket test-bucket-anton-patsev
```

### Copy a single file from the local system to cloud-based AWS S3 Buckets
```
aws --endpoint-url=https://storage.yandexcloud.net s3 cp test.txt s3://test-bucket-anton-patsev
```

### List only the Filenames of an S3 Bucket
```
aws --endpoint-url=https://storage.yandexcloud.net  s3api list-objects --bucket test-bucket-anton-patsev --output text --query "Contents[].{Key: Key}"
```

Links:
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/service-account/
 - https://cloud.yandex.com/en/docs/iam/operations/sa/create
 - https://cloud.yandex.com/en/docs/iam/operations/sa/assign-role-for-sam
 - https://cloud.yandex.com/en/docs/tutorials/infrastructure-management/terraform-quickstart
 - https://cloud.yandex.com/en/docs/compute/operations/vm-create/create-linux-vm
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/instance/
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/zone/
 - https://cloud.yandex.com/en/docs/iam/operations/sa/create-access-key
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/access-key/create
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/access-key/list
 - https://github.com/nar3k/yc-public-tasks/tree/master/k8s
