data "alicloud_resource_manager_resource_groups" "default" {
}

//create a new group
module "group" {
  source = "../.."

  #group
  create_group = true
  group_name   = var.group_name

  #dns
  create = false

  #dns_records
  add_records = false

}

//create a new dns
module "dns" {
  source = "../.."

  #group
  create_group        = false
  existing_group_name = module.group.this_group_name

  #dns
  create            = true
  domain_name       = "dns168.abc"
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0

  #dns_records
  add_records = false
}

//add records
module "records" {
  source = "../.."

  #group
  create_group        = false
  existing_group_name = module.group.this_group_name

  #dns
  create               = false
  existing_domain_name = module.dns.this_domain_name

  #dns_records
  add_records = true
  records     = var.records
}