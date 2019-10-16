provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/dns"
}

module "group" {
  source      = "./modules/group"
  group_list  = [var.group_name]
  group_count = var.group_name == "" ? 0 : 1
}

module "domain" {
  source       = "./modules/domain"
  domain_list  = [var.domain_name]
  domain_count = var.domain_name == "" ? 0 : 1
  group_id     = var.group_name == "" ? data.alicloud_dns_groups.customer.ids[0] : module.group.this_group_id[0]
}

module "records" {
  source      = "./modules/record"
  domain_name = module.domain.this_name[0]
  record_list = var.record_list
}

data "alicloud_dns_groups" "customer" {
  name_regex = var.group_name == "" ? var.ds_group_name : var.group_name
}

