## Select a service account (for example, s3-editor):
```
yc iam service-account list
```
Output:
```
+----------------------+------------------------+
|          ID                      |    NAME    |
+----------------------+------------------------+
| service_account_id_s3-editor     | s3-editor  |
| service_account_id_of_default-sa | default-sa |
+----------------------+------------------------+
```

## Create an access key for the s3-editor service account:
```
yc iam access-key create --service-account-name s3-editor
```
Output:
```
access_key:
  id: id_of_access_key
  service_account_id: xxxxxxxxxxxxxxxxxxxx # service_account_id of s3-editor
  created_at: "2022-03-05T11:36:02.469530376Z"
  key_id: key_id
secret: secret
```

Save the ID key_id and private key secret. You will not be able to get the key value again.

Links:
 - https://cloud.yandex.com/en/docs/iam/operations/sa/create-access-key
 