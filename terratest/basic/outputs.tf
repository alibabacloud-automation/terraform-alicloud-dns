
output "this_domain_name" {
  value = module.dns.this_domain_name[0]
}

output "this_group_name" {
  value = module.dns.this_group_name[0]
}

output "this_group_id" {
  value = module.dns.this_group_id[0]
}

output "this_records" {
  value = module.dns.this_records
}