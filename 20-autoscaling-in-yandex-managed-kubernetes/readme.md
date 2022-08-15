Для Kubernetes необходим сервисный аккаунт для ресурсов и узлов.
Сервисный аккаунт для ресурсов — это аккаунт, под которым сервису Kubernetes будут выделяться ресурсы в нашем облаке.
Сервисный аккаунт для узлов необходим уже созданным узлам самого кластера Kubernetes для доступа к другим ресурсам. Например, чтобы получить Docker-образы из Container Registry.

Роли для кластера K8s:
```
vpc.publicAdmin
k8s.clusters.agent
load-balancer.admin
```

Роли для узлов K8s:
```
container-registry.images.puller
container-registry.images.pusher
```
