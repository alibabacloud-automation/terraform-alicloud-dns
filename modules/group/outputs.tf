output "this_group_id" {
  	value 					= "${alicloud_dns_group.this.*.id}"
}