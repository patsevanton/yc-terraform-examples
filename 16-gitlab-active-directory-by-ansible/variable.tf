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

variable "windows_password" {
  type        = string
  description = "Password for Windows"
}

variable "pdc_hostname" {
  type        = string
  description = "pdc_hostname"
}

variable "gitlab_hostname" {
  type        = string
  description = "gitlab_hostname"
}

variable "pdc_domain" {
  type        = string
  description = "pdc_domain"
}

variable "pdc_domain_path" {
  type        = string
  description = "pdc_domain_path"
}

variable "gitlab_external_url" {
  type        = string
  description = "gitlab_external_url"
}

variable "letsencrypt_domain" {
  type        = string
  description = "letsencrypt_domain"
}

variable "pswd_gitlab_ldap_sync" {
  type        = string
  description = "pswd_gitlab_ldap_sync"
}

