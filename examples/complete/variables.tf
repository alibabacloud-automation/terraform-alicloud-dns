################################
# dns_group
################################
variable "group_name" {
  description = "DNS domain's parrent group name, If not set, a default name with prefix 'terraform-dns-group-' will be returned."
  type        = string
  default     = "dns-group"
}

################################
# dns_records
################################
variable "records" {
  description = "DNS record list.Each item can contains keys: 'rr'(The host record of the domain record. 'name' has been deprecated from 1.3.0, and use 'rr' instead.),'type'(The type of the domain. Valid values: A, NS, MX, TXT, CNAME, SRV, AAAA, CAA, REDIRECT_URL, FORWORD_URL. Default to A.),'value'(The value of domain record),'priority'(The priority of domain record. Valid values are `[1-10]`. When the `type` is `MX`, this parameter is required.),'ttl'(The ttl of the domain record. Default to 600.),'line'(The resolution line of domain record. Default value is default.)."
  type        = list(map(string))
  default = [
    {
      rr       = "www"
      type     = "A"
      ttl      = 600
      value    = "223.5.5.5"
      priority = 1
      line     = "default"
    }
  ]
}

