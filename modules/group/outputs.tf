output "group_id" {
  value = "${alicloud_dns_group.group.*.id}"
}

output "group_name" {
  value = "${alicloud_dns_group.group.*.name}"
}
