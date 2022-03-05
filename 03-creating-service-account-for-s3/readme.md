## Create service account named s3-editor
```
yc iam service-account create --name s3-editor
```

## Get a list of service accounts
```
yc iam service-account list
```
Output:
```
+----------------------+------------+
|          ID          |    NAME    |
+----------------------+------------+
| xxxxxxxxxxxxxxxxxxxx | s3-editor  | # service_account_id of s3-editor
| yyyyyyyyyyyyyyyyyyyy | default-sa | # service_account_id of default-sa
+----------------------+------------+
```

## Find out the service account ID by its name:
```
yc iam service-account get s3-editor
```
Output:
```
id: xxxxxxxxxxxxxxxxxxxx # service_account_id of s3-editor
folder_id: zzzzzzzzzzzzzzzzzzzz
created_at: "2022-03-05T11:19:58Z"
name: s3-editor
```

## Assign a role to the s3-editor service account using its ID:
```
yc resource-manager folder add-access-binding zzzzzzzzzzzzzzzzzzzz \
    --role editor \
    --subject serviceAccount:xxxxxxxxxxxxxxxxxxxx
```
where zzzzzzzzzzzzzzzzzzzz is folder_id

## List access bindings for the specified folder (where zzzzzzzzzzzzzzzzzzzz is folder_id)
```
yc resource-manager folder list-access-bindings zzzzzzzzzzzzzzzzzzzz
```
Output:
```
+---------+----------------+----------------------+
| ROLE ID |  SUBJECT TYPE  |      SUBJECT ID      |
+---------+----------------+----------------------+
| admin   | serviceAccount | yyyyyyyyyyyyyyyyyyyy | # role of service account yyyyyyyyyyyyyyyyyyyy
| editor  | serviceAccount | xxxxxxxxxxxxxxxxxxxx | # role of service account xxxxxxxxxxxxxxxxxxxx
+---------+----------------+----------------------+
```

## Delete service account named s3-editor
```
yc iam service-account delete --name s3-editor
```

Links:
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/service-account/
 - https://cloud.yandex.com/en/docs/iam/operations/sa/create
 - https://cloud.yandex.com/en/docs/iam/operations/sa/assign-role-for-sa
 - https://cloud.yandex.com/en/docs/iam/operations/sa/assign-role-for-sa
 - https://cloud.yandex.com/en/docs/tutorials/infrastructure-management/terraform-quickstart
 - https://cloud.yandex.com/en/docs/compute/operations/vm-create/create-linux-vm
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/instance/
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/zone/
 