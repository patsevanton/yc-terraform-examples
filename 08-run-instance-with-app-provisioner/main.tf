data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
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
      image_id = data.yandex_compute_image.ubuntu-20-04.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "yc-user:${file(var.public_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo DEBIAN_FRONTEND=noninteractive apt-get install mc jq -y",
      "sudo touch /test.txt"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.network_interface[0].nat_ip_address
    }
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

# Output values
output "public-ip-address-for-vm-1" {
  description = "Public IP address for vm-1"
  value       = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}
