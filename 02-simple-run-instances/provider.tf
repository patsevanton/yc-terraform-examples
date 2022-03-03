terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.70.0"
    }
  }
}

provider "yandex" {
  token     = "<OAuth>"
  cloud_id  = "<cloud ID>"
  folder_id = "<folder ID>"
  zone      = "<default availability zone>"
}