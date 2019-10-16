module "dns" {
  source        = "../../"
  domain_name   = var.domain_name
  group_name    = var.group_name
  ds_group_name = var.ds_group_name
  record_list   = var.record_list
}