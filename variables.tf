variable "region" {
  description = "(Deprecated from version 1.5.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.5.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.5.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.5.0) Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

################################
# dns
################################
variable "create" {
  description = "Whether to create a domain. Default to true."
  type        = bool
  default     = true
}

variable "existing_domain_name" {
  description = "The name of an existing domain. If set, 'create' will be ignored."
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "The name of domain."
  type        = string
  default     = ""
}

variable "existing_group_name" {
  description = "Id of the group in which the domain will add. If not supplied, then use default group."
  type        = string
  default     = ""
}

variable "resource_group_id" {
  description = "The Id of resource group which the DNS belongs."
  type        = string
  default     = ""
}

################################
# dns_records
################################
variable "records" {
  description = "DNS record list.Each item can contains keys: 'rr'(The host record of the domain record. 'name' has been deprecated from 1.3.0, and use 'rr' instead.),'type'(The type of the domain. Valid values: A, NS, MX, TXT, CNAME, SRV, AAAA, CAA, REDIRECT_URL, FORWORD_URL. Default to A.),'value'(The value of domain record),'priority'(The priority of domain record. Valid values are `[1-10]`. When the `type` is `MX`, this parameter is required.),'ttl'(The ttl of the domain record. Default to 600.),'line'(The resolution line of domain record. Default value is default.)."
  type        = list(map(string))
  default     = []
}

variable "add_records" {
  description = "Whether to add records to dns. Default to true."
  type        = bool
  default     = true
}

################################
# dns_group
################################
variable "create_group" {
  description = "Whether to create a DNS group. Default to false."
  type        = bool
  default     = false
}

variable "group_name" {
  description = "DNS domain's parrent group name, If not set, a default name with prefix 'terraform-dns-group-' will be returned."
  type        = string
  default     = ""
}

# Deprecated variables
variable "record_list" {
  description = "(Deprecated) It has been deprecated from 1.3.0, and use 'records' instead."
  type = list(object({
    name        = string
    host_record = string
    type        = string
    ttl         = number
    value       = string
    priority    = number
  }))
  default = []
}

