variable "name" {
  type    	= "map"
  default 	= {
    "a" 	= "rr_a"
    "cname" = "rr_cname"
    "aaaa" 	= "rr_aaaa"
    "mx"	= "rr_mx"
  }
}

variable "ttl" {
  type    	= "string"
  default 	= "700"
}

variable "type" {
  type    	= "map"
  default 	= {
    "a" 	= "A"
    "cname" = "CNAME"
    "aaaa" 	= "AAAA"
    "mx"	= "MX"
  }
}

variable "a_value" {
  default = {
    "0" = "223.5.5.5"
    "1" = "223.6.6.6"
  }
}

variable "a_count" {
	default = "2"
}

variable "mx_priority" {
  type    	= "string"
  default 	= "7"
}

variable "domain_id" {
  type      = "list"
}