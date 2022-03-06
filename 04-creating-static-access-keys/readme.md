## Select a service account (for example, s3editor):
```
yc iam service-account list
```
Output:
```
+----------------------+------------------------+
|          ID                      |    NAME    |
+----------------------+------------------------+
| service_account_id_s3editor      |  s3editor  |
| service_account_id_of_default-sa | default-sa |
+----------------------+------------------------+
```

## Create an access key for the s3editor service account:
```
yc iam access-key create --service-account-name s3editor
```
Output:
```
access_key:
  id: id_of_access_key
  service_account_id: xxxxxxxxxxxxxxxxxxxx # service_account_id of s3editor
  created_at: "2022-03-05T11:36:02.469530376Z"
  key_id: key_id
secret: secret
```

Save the ID key_id and private key secret. You will not be able to get the key value again.

## List access keys for the specified service account Access keys are used for the authentication by Yandex Object Storage API to provide compatibility with Amazon S3 API.
```
yc iam access-key list --service-account-name s3editor
```
Output:
```
+----------------------+----------------------+----------------------+
|          ID          |  SERVICE ACCOUNT ID  |        KEY ID        |
+----------------------+----------------------+----------------------+
| ACCESS_KEY_ID        | yyyyyyyyyyyyyyyyyyyy | zzzzzzzzzzzzzzzzzzzz |
+----------------------+----------------------+----------------------+
```

## Show information about the specified access key. Access keys are used for the authentication by Yandex Object Storage API to provide compatibility with Amazon S3 API.
```
yc iam access-key get ACCESS_KEY_ID
```
Output:
```
id: ACCESS_KEY_ID
service_account_id: xxxxxxxxxxxx
created_at: "2022-03-05T11:36:02Z"
key_id: zzzzzzzzzzzzzzzzzzzz
```

## Delete the specified access key Access keys are used for the authentication by Yandex Object Storage API to provide compatibility with Amazon S3 API.
```
yc iam access-key delete ACCESS_KEY_ID
```

Links:
 - https://cloud.yandex.com/en/docs/iam/operations/sa/create-access-key
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/access-key/create
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/access-key/list
 - https://github.com/nar3k/yc-public-tasks/tree/master/k8s

 
