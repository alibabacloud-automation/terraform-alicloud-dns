output "record_cname" {
	value 				= {
		"id"			= "${alicloud_dns_record.record_cname.*.id}"
		"host_record" 	= "${alicloud_dns_record.record_cname.0.host_record}"
		"type"			= "${alicloud_dns_record.record_cname.0.type}"
		"ttl"			= "${alicloud_dns_record.record_cname.0.ttl}"
		"value"			= "${alicloud_dns_record.record_cname.*.value}"
	}
}

output "record_a" {
	value 				= {
		"id"			= "${alicloud_dns_record.record_a.*.id}"
		"host_record" 	= "${alicloud_dns_record.record_a.0.host_record}"
		"type"			= "${alicloud_dns_record.record_a.0.type}"
		"ttl"			= "${alicloud_dns_record.record_a.0.ttl}"
		"value"			= "${alicloud_dns_record.record_a.*.value}"
	}
}

output "record_aaaa" {
	value 				= {
		"id"			= "${alicloud_dns_record.record_aaaa.*.id}"
		"host_record" 	= "${alicloud_dns_record.record_aaaa.0.host_record}"
		"type"			= "${alicloud_dns_record.record_aaaa.0.type}"
		"ttl"			= "${alicloud_dns_record.record_aaaa.0.ttl}"
		"value"			= "${alicloud_dns_record.record_aaaa.*.value}"
	}
}

output "record_mx" {
	value 				= {
		"id"			= "${alicloud_dns_record.record_mx.*.id}"
		"host_record" 	= "${alicloud_dns_record.record_mx.0.host_record}"
		"type"			= "${alicloud_dns_record.record_mx.0.type}"
		"ttl"			= "${alicloud_dns_record.record_mx.0.ttl}"
		"value"			= "${alicloud_dns_record.record_mx.*.value}"
	}
}