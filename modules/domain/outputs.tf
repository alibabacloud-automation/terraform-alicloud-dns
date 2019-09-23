output "this_name" {
  value = [flatten(alicloud_dns.this.*.name)]
}

