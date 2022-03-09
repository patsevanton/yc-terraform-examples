data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

## Create SA sa-editor
resource "yandex_iam_service_account" "sa-editor" {
  folder_id = var.yc_folder_id
  name      = "sa-editor"
}

## Grant permissions sa-editor
resource "yandex_resourcemanager_folder_iam_member" "sa-editor-permissions" {
  folder_id = var.yc_folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa-editor.id}"
}

resource "yandex_compute_instance_group" "ig-1" {
  name                = "fixed-ig"
  folder_id           = var.yc_folder_id
  service_account_id  = yandex_iam_service_account.sa-editor.id
  instance_template {
    platform_id = "standard-v3"
    resources {
      cores  = 2
      memory = 2
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu-20-04.id
      }
    }

    network_interface {
      network_id = yandex_vpc_network.network-1.id
      subnet_ids = [yandex_vpc_subnet.subnet-1.id]
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
  }

  scale_policy {
    fixed_scale {
      size = 2
    }
  }

  allocation_policy {
    zones = ["ru-central1-c"]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion = 0
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name       = "subnet1"
  zone       = "ru-central1-c"
  network_id = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
