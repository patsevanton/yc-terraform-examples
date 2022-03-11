## Get a list of public images
```
yc compute image list --folder-id standard-images
```

## Get a list family of public images
```
yc compute image list --folder-id standard-images | cut -d "|" -f 4 | grep -v "+" | sort -u
```

## Get image_id for 'ubuntu-2004-lts ' family
```
yc compute image list --folder-id standard-images | grep 'ubuntu-2004-lts '
```

## Show information about the latest image that is part of an image family ubuntu-2004-lts
```
yc compute image get-latest-from-family ubuntu-2004-lts --folder-id standard-images
```

## Show information about the latest image that is part of an image family windows-2022-dc-gvlk
```
yc compute image get-latest-from-family windows-2022-dc-gvlk --folder-id standard-images
```

## Get latest image_id for 'ubuntu-2004-lts ' family
```
yc compute image list --folder-id standard-images | grep 'ubuntu-2004-lts ' | cut -d "|" -f 2,3 | grep $(date +'%Y') | sort -k 2 -r | head -n 1 | cut -d "|" -f 1
```

## Get latest image_id for 'windows-2022-dc-gvlk ' family
```
yc compute image list --folder-id standard-images | grep 'windows-2022-dc-gvlk ' | cut -d "|" -f 2,3 | grep $(date +'%Y') | sort -k 2 -r | head -n 1 | cut -d "|" -f 1
```
