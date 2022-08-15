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