## Create SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.yc_folder_id
  name      = "terraformsa"
}

## Grant permissions 
resource "yandex_resourcemanager_folder_iam_member" "sa-storage-admin" {
  folder_id = var.yc_folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

## Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}
