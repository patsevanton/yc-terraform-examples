### List disk types
```
yc compute disk-type list
```

### Create virtual machine (instances)
```
yc compute instance create \
    --name instance-custom-type-disk \
    --network-interface nat-ip-version=ipv4 \
    --create-boot-disk type=network-hdd,image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub
```

### List virtual machine (instances)
```
yc compute instance list
```

### Delete the specified virtual machine (instances)
```
yc compute instance delete instance-custom-type-disk
```

Links:
 - https://postgrespro.ru/products/postgrespro/yandexcloud/enterprise