Install docker

```
yc container registry create --name my-registry
```

```
yc container registry configure-docker
```

```
docker build . -t cr.yandex/crple9fovab5gip297ja/ubuntu-nginx:latest
```


```
docker push cr.yandex/crple9fovab5gip297ja/ubuntu-nginx:latest
```