FOLDER_ID=$(yc config get folder-id)
yc iam service-account create --name s3editor
SA_ID=$(yc iam service-account get --name s3editor --format json | jq .id -r)
yc resource-manager folder add-access-binding --id $FOLDER_ID --role storage.admin --subject serviceAccount:$SA_ID
yc iam access-key create --service-account-name s3editor
