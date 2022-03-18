variable "yc_token" {
  type        = string
  description = "Yandex Cloud API key"
}

variable "yc_cloud_id" {
  type        = string
  description = "Yandex Cloud id"
}

variable "yc_folder_id" {
  type        = string
  description = "Yandex Cloud folder id"
}

variable "yc_zone" {
  type        = string
  description = "Yandex Cloud compute default zone"
  default     = "ru-central1-c"
}

variable "hostname" {
  type        = string
  description = "hostname"
}

variable "gitlab_external_url" {
  type        = string
  description = "gitlab_external_url"
}

variable "domain" {
  type        = string
  description = "domain"
}
