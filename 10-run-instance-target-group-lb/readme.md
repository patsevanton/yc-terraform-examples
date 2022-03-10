### Get subnet list
```
yc vpc subnet list
```

### Show availability zones
```
yc compute zone list
```

### Create virtual machine first-instance with nginx.
```
yc compute instance create \
    --name first-instance \
    --hostname first-instance \
    --zone ru-central1-b \
    --metadata-from-file user-data=cloud-init-with-ssh.yaml \
    --network-interface subnet-name=apatsev-ru-central1-b,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts
```

### List virtual machine (instances)
```
yc compute instance list
```

### Create a target group and add the appropriate VM to it as a target by specifying the subnet-id and address of the VM in the --target flag
```
yc load-balancer target-group create \
  --region-id ru-central1 \
  --name test-tg-1 \
  --target subnet-id=e2l3p2t1krju8faen7ob,address=10.129.0.32
```

### Delete the specified target-group
```
yc load-balancer target-group delete test-tg-1
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
 