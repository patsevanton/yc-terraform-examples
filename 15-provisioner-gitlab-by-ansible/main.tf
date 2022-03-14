data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "gitlab" {

  name        = "gitlab"
  platform_id = "standard-v3"
  hostname    = var.hostname

  resources {
    cores  = 2
    memory = 10
  }

  boot_disk {
    initialize_params {
      size     = 40
      type     = "network-ssd"
      image_id = data.yandex_compute_image.ubuntu-20-04.id
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.subnet-1.id
    nat            = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.network_interface.0.nat_ip_address
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    inline = [
      "echo hello"
    ]
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
output "public_ip" {
  description = "Public IP address for active directory"
  value = yandex_compute_instance.gitlab.network_interface.0.nat_ip_address
}

resource "local_file" "host_ini" {
  content  = "${data.template_file.host_ini.rendered}"
  filename = "host.ini"
}

data "template_file" "host_ini" {
  template = "${file("host_ini.tmpl")}"
  vars = {
    hostname           = var.hostname
    gitlab_external_url  = var.gitlab_external_url
    public_ip          = yandex_compute_instance.gitlab.network_interface.0.nat_ip_address
    domain             = var.domain
  }
}

resource "local_file" "inventory_yml" {
  content  = "${data.template_file.inventory_yml.rendered}"
  filename = "inventory.yml"
}

data "template_file" "inventory_yml" {
  template = "${file("inventory_yml.tmpl")}"
  vars = {
    hostname           = var.hostname
    gitlab_external_url  = var.gitlab_external_url
    public_ip          = yandex_compute_instance.gitlab.network_interface.0.nat_ip_address
    domain             = var.domain
  }
}
