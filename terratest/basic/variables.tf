variable "domain_name" {
  description = "DNS domain name"
}

variable "group_name" {
  description = "DNS domain`s parrent group name"
  default     = ""
}

variable "existing_group_name" {
  description = "Id of the group in which the domain will add. If not supplied, then use default group."
  type        = string
  default     = ""
}

variable "records" {
  description = "DNS record list.Each item can contains keys: 'rr'(The host record of the domain record. 'name' has been deprecated from 1.3.0, and use 'rr' instead.),'type'(The type of the domain. Valid values: A, NS, MX, TXT, CNAME, SRV, AAAA, CAA, REDIRECT_URL, FORWORD_URL. Default to A.),'value'(The value of domain record),'priority'(The priority of domain record. Valid values are `[1-10]`. When the `type` is `MX`, this parameter is required.),'ttl'(The ttl of the domain record. Default to 600.),'line'(The resolution line of domain record. Default value is default.)."
  type        = list(map(string))
  default     = []
}

# Deprecated variables
variable "record_list" {
  description = "(Deprecated) It has been deprecated from 1.3.0, and use 'records' instead."
  type = list(object({
    name        = string
    type        = string
    ttl         = number
    value       = string
    priority    = number
    host_record = string
  }))
  default = []
}

variable "ds_group_name" {
  description = "(Deprecated) It has been deprecated from 1.3.0, and use 'existing_group_name' instead."
  type        = string
  default     = ""
}