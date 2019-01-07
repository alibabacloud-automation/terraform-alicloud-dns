output "id" {
  value = "${alicloud_dns.dns.*.id}"
}

output "name" {
  value = "${alicloud_dns.dns.*.name}"
}