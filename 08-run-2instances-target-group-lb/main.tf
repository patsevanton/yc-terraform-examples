data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "vm" {
  name = "vm-${count.index}"
  platform_id = "standard-v3"
  count = var.instances

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
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
    user-data = file("cloud-init.yaml")
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

resource "yandex_lb_target_group" "loadbalancer" {
  name      = "lb-group"
  folder_id = var.yc_folder_id

  target {
    address   = yandex_compute_instance.vm-1.network_interface.0.ip_address
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }

  target {
    address   = yandex_compute_instance.vm-2.network_interface.0.ip_address
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }

}

resource "yandex_lb_network_load_balancer" "lb" {
  name = "loadbalancer"
  type = "external"

  listener {
    name        = "listener"
    port        = 80
    target_port = 80

    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.loadbalancer.id

    healthcheck {
      name = "tcp"
      tcp_options {
        port = 80
      }
    }
  }
}

output "loadbalancer_ip_address" {
  value = yandex_lb_network_load_balancer.lb.listener.*.external_address_spec[0].*.address
}
