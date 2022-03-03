## Get subnet list
```
yc vpc subnet list
```

## Show availability zones
```
yc compute zone list
```

##
```
yc compute instance create \
    --name first-instance \
    --zone ru-central1-b \
    --network-interface subnet-name=apatsev-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=centos-7 \
    --ssh-key ~/.ssh/id_rsa.pub
```

## List virtual machine instances
```
yc compute instance list
```

## Delete the specified virtual machine instance
```
yc compute instance delete <INSTANCE-NAME>|<INSTANCE-ID>
```