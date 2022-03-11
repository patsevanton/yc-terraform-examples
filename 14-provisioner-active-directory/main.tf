data "yandex_compute_image" "windows-2022-dc-gvlk" {
  family = "windows-2022-dc-gvlk"
}

resource "yandex_compute_instance" "vm-1" {

  name        = "active-directory"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      size     = 60
      type     = "network-ssd"
      image_id = data.yandex_compute_image.windows-2022-dc-gvlk.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
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

# Output values
output "public-ip-address-for-vm-1" {
  description = "Public IP address for vm-1"
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}
