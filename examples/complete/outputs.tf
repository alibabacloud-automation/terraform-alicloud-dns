output "this_domain_name" {
  description = "The name of domain"
  value       = module.test.this_domain_name
}

output "this_domain_records" {
  description = "List of the domain records"
  value       = module.test.this_domain_records
}

output "this_group_id" {
  description = "Id of the group in which the domain will add"
  value       = module.test.this_group_id
}

output "this_group_name" {
  description = "Name of the group in which the domain will add"
  value       = module.test.this_group_name
}