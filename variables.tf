variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "domain_name" {
  description = "DNS domain name"
}

variable "group_name" {
  description = "DNS domain`s parrent group name"
  default     = ""
}

variable "ds_group_name" {
  description = "Dns domain`s parrent group name for data source"
  default     = ""
}

variable "record_list" {
  description = "Dns record list"
  type = list(object({
    name        = string
    host_record = string
    type        = string
    ttl         = number
    value       = string
    priority    = number
  }))
}

