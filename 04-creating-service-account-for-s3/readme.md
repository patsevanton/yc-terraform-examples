## Create service account named s3admin
```
yc iam service-account create --name s3admin
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
| xxxxxxxxxxxxxxxxxxxx | s3admin  | # service_account_id of s3admin
| yyyyyyyyyyyyyyyyyyyy | default-sa | # service_account_id of default-sa
+----------------------+------------+
```

## Find out the service account ID by its name:
```
yc iam service-account get s3admin
```
Output:
```
id: xxxxxxxxxxxxxxxxxxxx # service_account_id of s3admin
folder_id: zzzzzzzzzzzzzzzzzzzz
created_at: "2022-03-05T11:19:58Z"
name: s3admin
```

## Assign a role to the s3admin service account using its ID:
```
yc resource-manager folder add-access-binding zzzzzzzzzzzzzzzzzzzz \
    --role storage.admin \
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

## Delete service account named s3admin
```
yc iam service-account delete --name s3admin
```

Links:
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/iam/service-account/
 - https://cloud.yandex.com/en/docs/iam/operations/sa/create
 - https://cloud.yandex.com/en/docs/iam/operations/sa/assign-role-for-sam
 - https://cloud.yandex.com/en/docs/tutorials/infrastructure-management/terraform-quickstart
 - https://cloud.yandex.com/en/docs/compute/operations/vm-create/create-linux-vm
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/instance/
 - https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/zone/
 