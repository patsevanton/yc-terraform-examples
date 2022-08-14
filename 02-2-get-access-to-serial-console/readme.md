### Get subnet list
```
yc vpc subnet list
```

### Show availability zones
```
yc compute zone list
```

### Create virtual machine with serial-port. Default CPU 2, MEM 2GB, DISK 5GB
```
yc compute instance create \
    --name first-instance \
    --hostname first-instance \
    --zone ru-central1-b \
    --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub \
    --metadata serial-port-enable=1
```

### List virtual machine (instances)
```
yc compute instance list
```

### Get public ip
```
yc compute instance get first-instance --format json | jq -r '.network_interfaces[].primary_v4_address.one_to_one_nat.address'
```

### Enter in instance
```
ssh yc-user@ip
```

### Set password yc-user
```
sudo passwd yc-user
```

### Access to the serial console 
```
ssh -t -p 9600 -o IdentitiesOnly=yes -i ~/.ssh/<имя закрытого ключа> <ID виртуальной машины>.<имя пользователя>@serialssh.cloud.yandex.net
```

```
ssh -t -p 9600 -o IdentitiesOnly=yes -i ~/.ssh/id_rsa epduem5sc5ru9t7ork0g.yc-user@serialssh.cloud.yandex.net
```


### Delete the specified virtual machine (instances)
```
yc compute instance delete first-instance
```
