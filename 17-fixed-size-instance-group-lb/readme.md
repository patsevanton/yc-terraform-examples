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

### Create a network
```
yc vpc network create --name custom-network
```

### Get network list
```
yc vpc network list
```

### Show availability zones
```
yc compute zone list
```

### Create an instance group in the default folder
```
yc compute instance-group create --file specification.yaml 
```

Links:
 - https://postgrespro.ru/products/postgrespro/yandexcloud/enterprise
 - https://cloud.yandex.com/en/docs/compute/operations/instance-groups/create-fixed-group
 - https://git.cloud-team.ru/lections/kubernetes_setup/blob/master/terraform/k8s-cluster.tf
 - https://github.com/yandextf/terraform-yandex-actions
 

### Show list instance-group
```
yc compute instance-group list 
```

### Create network-load-balancer
```
yc load-balancer network-load-balancer create --region-id ru-central1 --name my-load-balancer --listener name=my-listener,external-ip-version=ipv4,port=80
```


### Show information about the specified target group
```
yc load-balancer target-group list
```

### Attaches a target group to the specified network load balancer
```
yc load-balancer network-load-balancer attach-target-group enpb766nmk45fqj33kgc   --target-group target-group-id=enpgnvefe0t3qntvv4od,healthcheck-name=test-health-check,healthcheck-interval=2s,healthcheck-timeout=1s,healthcheck-unhealthythreshold=2,healthcheck-healthythreshold=2,healthcheck-http-port=80
```

### Show states of target resources in the attached target group
```
yc load-balancer network-load-balancer target-states enpb766nmk45fqj33kgc --target-group-id enpgnvefe0t3qntvv4od
```

### Update spec
```
yc compute instance-group update --name my-group --file specification.yaml
```

###  Remove instance-group and network-load-balancer
```
yc compute instance-group delete --name my-group

yc load-balancer network-load-balancer delete --name my-load-balancer
```

### Delete service-account
```
yc iam service-account delete --name computeadmin
```