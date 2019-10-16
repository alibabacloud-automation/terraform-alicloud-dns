output "this_group_id" {
  value = alicloud_dns_group.this.*.id
}

output "this_group_name" {
  value = alicloud_dns_group.this.*.name
}

