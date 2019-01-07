module "group" {
  source      = "./modules/group"
}

module "domain" {
  source      = "./modules/domain"
  group       = "${module.group.group_id}"
  name        = "${var.domain_names}"
}

module "record" {
  source      = "./modules/record"
  ttl         = "${var.record_ttl}"
  type        = "${var.record_type}"
  name        = "${var.record_name}"
  a_value     = "${var.a_value}"
  a_count     = "${var.a_count}"
  mx_priority = "${var.mx_priority}"
  domain_id   = "${module.domain.id}"
}