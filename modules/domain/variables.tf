variable "domain_list" {
	description					= "Domain name list"
  	type 						= "list"
}

variable "domain_count" {
	description					= "Domain name length"
}

variable "group_id" {
	description					= "Domain parrent group id"
	default 					= ""
}

