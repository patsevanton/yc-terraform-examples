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

### Create a subnet in the specified network
```
yc vpc subnet create \
--name custom-subnet \
--range 192.168.0.0/24 \
--network-name custom-network
```

### Get subnet list
```
yc vpc subnet list
```

### Create virtual machine (instances)
```
yc compute instance create \
    --service-account-name computeadmin \
    --name instance-custom-vpc \
    --hostname instance-custom-vpc \
    --zone ru-central1-b \
    --network-interface subnet-name=custom-subnet,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub
```

### List virtual machine (instances)
```
yc compute instance list
```

### Delete the specified virtual machine (instances)
```
yc compute instance delete first-instance
```

Links:
 - https://postgrespro.ru/products/postgrespro/yandexcloud/enterprise