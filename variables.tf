variable "group_list" {
    description           = "DNS domain Group list"
    type                  = "list"
}

variable "group_count" {
    description           = "DNS domain group list length"
}

variable "domain_list" {
    description           = "DNS domain name list"
    type                  = "list"
}

variable "group_name" {
    description           = "DNS domain`s parrent group name"
}

variable "domain_count" {
    description           = "Dns domain name list length" 
}

variable "record_list" {
    description           = "Dns record list"
    type                  = "list"
}

variable "record_count" {
    description           = "Dns record list length"
}
