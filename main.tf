module "group" {
    source                                  = "./modules/group"
    group_list                              = ["${var.group_name}"]
    group_count                             = "${var.group_name == "" ? 0 : 1}"
}

module "domain" {
    source                                  = "./modules/domain"
    domain_list                             = ["${var.domain_name}"]
    domain_count                            = "${var.domain_name == "" ? 0 : 1 }"
    group_id                                = "${var.group_name == "" && var.ds_group_name == "" ? "" : data.alicloud_dns_groups.customer.groups.0.group_id}"
}

module "records" {
    source                                  = "./modules/record"
    domain_name                             = "${var.domain_name}"
    record_list                             = "${var.record_list}"
    record_count                            = "${var.record_count}"
}

data "alicloud_dns_groups" "customer" {
  name_regex                                = "${var.group_name == "" ? var.ds_group_name : var.group_name}"
  "output_file"                             = "group.json"
}