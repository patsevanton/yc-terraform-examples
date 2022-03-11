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
    --network-interface subnet-name=apatsev-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub
```

### Create virtual machine (instances). CPU 4, MEM 4GB, DISK 10GB
```
yc compute instance create \
    --name first-instance \
    --hostname first-instance \
    --zone ru-central1-b \
    --cores=4 \
    --memory=4 \
    --network-interface subnet-name=apatsev-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk size=10GB,image-folder-id=standard-images,image-family=ubuntu-2004-lts \
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
 - https://gist.github.com/jugatsu/e9e09db6c7cba6900fce2d275dba515f
 - https://github.com/justin-p/ansible-role-pdc/issues/4
 - https://nikolaymatrosov.medium.com/rdp-%D0%BD%D0%B0-ubuntu-%D0%B2-yandex-cloud-c9d7870a47cc
 - https://yetiops.net/posts/proxmox-terraform-cloudinit-windows/
 