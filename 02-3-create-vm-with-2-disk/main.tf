data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

output "image_id_ubuntu_20_04" {
  value = data.yandex_compute_image.ubuntu-20-04
}
