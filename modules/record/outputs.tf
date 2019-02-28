output "this_records" {
	value				= "${formatlist("%v   %64v : %10v   %5v   %v", alicloud_dns_record.this.*.id, alicloud_dns_record.this.*.host_record, alicloud_dns_record.this.*.type,alicloud_dns_record.this.*.ttl, alicloud_dns_record.this.*.value)}"
}
