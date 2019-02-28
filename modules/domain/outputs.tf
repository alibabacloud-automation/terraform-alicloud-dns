output "name" {
  	value 					= ["${flatten(alicloud_dns.this.*.name)}"]
}