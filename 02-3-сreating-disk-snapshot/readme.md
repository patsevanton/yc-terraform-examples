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

### Get public ip
```
yc compute instance get first-instance --format json | jq -r '.network_interfaces[].primary_v4_address.one_to_one_nat.address'
```

### Enter in instance
```
ssh yc-user@ip
```

### Write the OS cache to disk inside instance
```
sudo sync
```

### Freeze the file system inside instance
```
sudo fsfreeze -f <точка монтирования>
```

### Get a list of disks in the default folder
```
yc compute disk list
```

###
```
yc compute snapshot create \
  --name first-snapshot \
  --description "my first snapshot via CLI" \
  --disk-id fhm4aq4hvq5g3nepvt9b
```

### List snapshots
```
yc compute snapshot list
```

### Create virtual machine from snapshot - next example

### Delete the specified virtual machine (instances)
```
yc compute instance delete first-instance
```

### Delete the specified snapshot 
```
yc compute snapshot delete
```

Links:
 - https://github.com/yandex-cloud/terraform-provider-yandex/issues/130
 - https://github.com/sport24ru/terraform-yandex-managed-kubernetes/blob/master/main.tf
 - https://vc.ru/dev/318266-kak-sekonomit-vremya-dengi-i-nervy-na-prostyh-zadachah
 - https://github.com/yandex-cloud/terraform-provider-yandex/issues/121
 - https://habr.com/ru/company/rebrainme/blog/538410/
 


 