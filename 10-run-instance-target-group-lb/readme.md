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
    --network-interface subnet-name=apatsev-ru-central1-b,nat-ip-version=ipv4 \
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
 - https://github.com/yandex-cloud/terraform-provider-yandex/issues/130
 - https://github.com/sport24ru/terraform-yandex-managed-kubernetes/blob/master/main.tf
 - https://vc.ru/dev/318266-kak-sekonomit-vremya-dengi-i-nervy-na-prostyh-zadachah
 - https://github.com/yandex-cloud/terraform-provider-yandex/issues/121
 - https://habr.com/ru/company/rebrainme/blog/538410/
 