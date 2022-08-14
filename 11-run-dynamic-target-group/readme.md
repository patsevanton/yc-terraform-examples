### Get subnet list
```
yc vpc subnet list
```

### Show availability zones
```
yc compute zone list
```

### Create virtual machine (instances)
```
yc compute instance create \
    --name first-instance \
    --hostname first-instance \
    --zone ru-central1-b \
    --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub
```

### Create virtual machine (instances)
```
yc compute instance create \
    --name second-instance \
    --hostname second-instance \
    --zone ru-central1-b \
    --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts \
    --ssh-key ~/.ssh/id_rsa.pub
```

### List virtual machine (instances)
```
yc compute instance list
```

### Create an internal network load balancer with a listener
```
yc load-balancer network-load-balancer create \
--name lb-test \
--region-id ru-central1 \
--listener name=test-listener,port=80,subnet-id=apatsev-ru-central1-c
```

### List virtual machine (instances)
```
yc compute instance list
```

### Create a target group and add the appropriate VM.
```
yc load-balancer target-group create \
  --region-id ru-central1 \
  --name test-tg-1 \
  --target subnet-id=e2l3p2t1krju8faen7ob,address=10.129.0.32 \
  --target subnet-id=e2l3p2t1krju8faen7ob,address=10.129.0.7
```

### Delete the specified target-group
```
yc load-balancer target-group delete test-tg-1
```

### Delete the specified virtual machine (instances)
```
yc compute instance delete first-instance
yc compute instance delete second-instance
```

Links:
 - https://github.com/AlBichutsky/wiki/wiki/Terraform
 - https://github.com/Otus-DevOps-2020-08/Tyatyushkin_infra
 - https://githubmemory.com/repo/barmank32/barmank32_infra
 - https://t.me/terraform_ru/27343
 - https://github.com/yandex-cloud/usecases
 