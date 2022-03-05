## Create service account named my-robot
```
yc iam service-account create --name my-robot
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
| aje6o61dvog2h6g9a33s | my-robot   |
| yyyy                 | default-sa |
+----------------------+------------+
```

## Find out the service account ID by its name:
```
yc iam service-account get my-robot
```
Output:
```
id: aje6o61dvog2h6g9a33s
folder_id: xxxxx
created_at: "2022-03-05T07:57:11.052929144Z"
name: my-robot
```

## Assign a role to the my-robot service account using its ID:
```
yc resource-manager folder add-access-binding my-folder \
    --role viewer \
    --subject serviceAccount:aje6o61dvog2h6g9a33s
```


## Delete service account named my-robot
```
yc iam service-account create --name my-robot
```
