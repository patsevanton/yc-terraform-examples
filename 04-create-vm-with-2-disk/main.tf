data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_disk" "secondary_disk" {
  name = "secondary-disk"
  type = "network-hdd"
  zone = "ru-central1-b"
  size = 5
}

resource "yandex_compute_instance" "vm-with-2-disk" {

  name        = "vm-with-2-disk"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      size     = 10
      type     = "network-hdd"
      image_id = data.yandex_compute_image.ubuntu-20-04.id
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.secondary_disk.id
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default-ru-central1-b.id
    nat       = true
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_rsa.pub")}"
  }
}

data "yandex_vpc_network" "default" {
  name = "default"
}

data "yandex_vpc_subnet" "default-ru-central1-b" {
  name = "default-ru-central1-b"
}
