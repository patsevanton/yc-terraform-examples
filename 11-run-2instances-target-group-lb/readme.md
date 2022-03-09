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
    --service-account-name computeadmin \
    --name first-instance \
    --hostname first-instance \
    --zone ru-central1-b \
    --cores=2 \
    --memory=2 \
    --network-interface subnet-name=apatsev-ru-central1-b,nat-ip-version=ipv4 \
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

### List target groups
```
yc load-balancer target-group list 
```

### Delete the specified virtual machine (instances)
```
yc compute instance delete first-instance
```

Links:
 - https://github.com/AlBichutsky/wiki/wiki/Terraform
 - https://github.com/Otus-DevOps-2020-08/Tyatyushkin_infra
 - https://githubmemory.com/repo/barmank32/barmank32_infra
 - https://t.me/terraform_ru/27343