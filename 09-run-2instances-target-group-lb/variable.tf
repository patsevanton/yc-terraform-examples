variable "yc_token" {
  type = string
  description = "Yandex Cloud API key"
}

variable "yc_cloud_id" {
  type = string
  description = "Yandex Cloud id"
}

variable "yc_folder_id" {
  type = string
  description = "Yandex Cloud folder id"
}

variable "yc_zone" {
  type = string
  description = "Yandex Cloud compute default zone"
  default = "ru-central1-c"
}

variable "public_key_path" {
  description = "Path to ssh public key, which would be used to access workers"
  default     = "~/.ssh/id_rsa.pub"
}

variable "instances" {
  description = "count instances"
  default     = 1
}
