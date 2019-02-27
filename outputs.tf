output "group_ids" {
  	value 						= ["${flatten(alicloud_dns_group.this.*.id)}"]
}

output "group_names" {
  	value 						= ["${flatten(alicloud_dns_group.this.*.name)}"]
}

output "domain_names" {
	value 						= ["${flatten(alicloud_dns.this.*.name)}"]
}

output "record_info" {
	value 						= "${formatlist("%v   %64v : %10v   %5v   %v", alicloud_dns_record.this.*.id, alicloud_dns_record.this.*.host_record, alicloud_dns_record.this.*.type,alicloud_dns_record.this.*.ttl, alicloud_dns_record.this.*.value)}"
}
