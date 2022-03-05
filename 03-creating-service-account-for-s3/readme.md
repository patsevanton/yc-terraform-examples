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
| xxxxxxxxxxxxxxxxxxxx | s3-editor  |
| yyyyyyyyyyyyyyyyyyyy | default-sa |
+----------------------+------------+
```

## Find out the service account ID by its name:
```
yc iam service-account get s3-editor
```
Output:
```
id: xxxxxxxxxxxxxxxxxxxx
folder_id: zzzzzzzzzzzzzzzzzzzzz
created_at: "2022-03-05T07:57:11.052929144Z"
name: s3-editor
```

## Assign a role to the s3-editor service account using its ID:
```
yc resource-manager folder add-access-binding zzzzzzzzzzzzzzzzzzzzz \
    --role editor \
    --subject serviceAccount:xxxxxxxxxxxxxxxxxxxx
```

## List access bindings for the specified folder
```
yc resource-manager folder list-access-bindings zzzzzzzzzzzzzzzzzzzzz
```
Output:
```
+---------+----------------+----------------------+
| ROLE ID |  SUBJECT TYPE  |      SUBJECT ID      |
+---------+----------------+----------------------+
| admin   | serviceAccount | yyyyyyyyyyyyyyyyyyyy |
| editor  | serviceAccount | xxxxxxxxxxxxxxxxxxxx |
+---------+----------------+----------------------+
```

## Delete service account named s3-editor
```
yc iam service-account delete --name s3-editor
```
