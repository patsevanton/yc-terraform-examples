data "yandex_compute_image" "windows-2022-dc-gvlk" {
  family = "windows-2022-dc-gvlk"
}

data "template_file" "userdata_win" {
  template = file("user_data.tmpl")
  vars = {
    windows_password   = var.windows_password
  }
}

resource "yandex_compute_instance" "active_directory" {

  name        = "active-directory"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 6
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
    user-data = data.template_file.userdata_win.rendered
    serial-port-enable = 1
  }

  provisioner "remote-exec" {
    connection {
      type      = "winrm"
      user      = "Administrator"
      host      = self.network_interface.0.nat_ip_address
      password  = var.windows_password
      https     = true
      port      = 5986
      insecure  = true
      timeout   = "15m"
    }

    inline = [
      "echo hello",
      "powershell.exe Write-Host hello",
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
output "public_ip_address_for_active_directory" {
  description = "Public IP address for active directory"
  value = yandex_compute_instance.active_directory.network_interface.0.nat_ip_address
}
