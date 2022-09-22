data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "vm-1" {

  name        = "linux-vm"
  zone        = "ru-central1-b"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-20-04.id
    }
  }

  network_interface {
    subnet_id  = data.yandex_vpc_subnet.default-ru-central1-b.id
    nat        = true
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address.0.address
  }

  metadata = {
    ssh-keys  = "ubuntu:${file(var.public_key_path)}"
    user-data = file("cloud-init.yaml")
  }
  
}

data "yandex_vpc_network" "default" {
  name = "default"
}

data "yandex_vpc_subnet" "default-ru-central1-b" {
  name = "default-ru-central1-b"
}

resource "yandex_vpc_address" "addr" {
  name = "static-ip"
  external_ipv4_address {
    zone_id = "ru-central1-b"
  }
}
