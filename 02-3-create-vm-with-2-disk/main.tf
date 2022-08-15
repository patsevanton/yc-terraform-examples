data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_disk" "secondary_disk" {
  name     = "secondary-disk"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  size     = 5
}

resource "yandex_compute_instance" "vm-1" {

  name        = "linux-vm"
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
    subnet_id   = yandex_vpc_subnet.subnet-1.id
    nat         = true
  }

  metadata = {
    ssh-keys = "yc-user:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
