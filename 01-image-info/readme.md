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

## Get latest image_id for 'ubuntu-2004-lts ' family
```
yc compute image list --folder-id standard-images | grep 'ubuntu-2004-lts ' | cut -d "|" -f 3 | grep $(date +'%Y') | head -n 1
```