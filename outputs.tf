output "this_domain_name" {
  description = "The name of domain"
  value       = concat(alicloud_dns.this.*.name, [""])[0]
}

output "this_domain_records" {
  description = "List of the domain records"
  value       = formatlist("%v   %64v : %10v   %5v   %v", alicloud_dns_record.this.*.id, alicloud_dns_record.this.*.host_record, alicloud_dns_record.this.*.type, alicloud_dns_record.this.*.ttl, alicloud_dns_record.this.*.value)

}

output "this_group_id" {
  description = "Id of the group in which the domain will add"
  value       = concat(alicloud_dns_group.this.*.id, [""])[0]
}

output "this_group_name" {
  description = "Name of the group in which the domain will add"
  value       = concat(alicloud_dns_group.this.*.name, [""])[0]
}

