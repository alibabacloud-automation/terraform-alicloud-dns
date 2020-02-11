locals {
  existing_group_name = var.existing_group_name != "" ? var.existing_group_name : var.ds_group_name
  records             = length(var.records) > 0 ? var.records : var.record_list
}

module "dns" {
  source              = "../../"
  domain_name         = var.domain_name
  group_name          = var.group_name
  existing_group_name = local.existing_group_name
  records             = local.records
}