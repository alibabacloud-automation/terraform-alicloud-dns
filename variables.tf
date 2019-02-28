variable "domain_name" {
    description           = "DNS domain name"
}

variable "group_name" {
    description           = "DNS domain`s parrent group name"
    default               = ""
}

variable "ds_group_name" {
    description           = "Dns domain`s parrent group name for data source"
    default               = ""
}

variable "record_list" {
    description           = "Dns record list"
    type                  = "list"
}

variable "record_count" {
    description           = "Dns record list length"
}
