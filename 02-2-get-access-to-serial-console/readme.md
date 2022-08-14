### Get subnet list
```
yc vpc subnet list
```

### Show availability zones
```
yc compute zone list
```

### Create virtual machine (instances). Default CPU 2, MEM 2GB, DISK 5GB
```
yc compute instance create \
    --name first-instance \
    --hostname first-instance \
    --zone ru-central1-b \
    --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub
```

### List virtual machine (instances)
```
yc compute instance list
```

### Set password ubuntu
```
sudo passwd ubuntu
```

###
```
ssh -t -p 9600 -o IdentitiesOnly=yes -i ~/.ssh/id_rsa <ID виртуальной машины>.<имя пользователя>@serialssh.cloud.yandex.net
```