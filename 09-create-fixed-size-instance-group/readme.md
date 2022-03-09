### Get FOLDER_ID
```
FOLDER_ID=$(yc config get folder-id)
```

### Create service-account
```
yc iam service-account create --name computeadmin
```

### Get id of service-account
```
SA_ID=$(yc iam service-account get --name computeadmin --format json | jq .id -r)
```

### Assign a role to the computeadmin service account using its ID:
```
yc resource-manager folder add-access-binding --id $FOLDER_ID --role compute.admin --subject serviceAccount:$SA_ID
```

### Create a network
```
yc vpc network create --name custom-network
```

### Get network list
```
yc vpc network list
```

### Show availability zones
```
yc compute zone list
```

### Create an instance group in the default folder
```
yc compute instance-group create --file specification.yaml
```

Links:
 - https://postgrespro.ru/products/postgrespro/yandexcloud/enterprise
 - https://cloud.yandex.com/en/docs/compute/operations/instance-groups/create-fixed-group
 - https://git.cloud-team.ru/lections/kubernetes_setup/blob/master/terraform/k8s-cluster.tf
 
