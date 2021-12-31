data "alicloud_dns_groups" "this" {
  name_regex = var.existing_group_name
}

resource "random_uuid" "this" {}

locals {
  create_group = var.existing_group_name != "" ? false : var.create_group
  group_name   = var.group_name != "" ? var.group_name : substr("terraform-dns-group-${replace(random_uuid.this.result, "-", "")}", 0, 32)

  create      = var.existing_domain_name != "" ? false : var.create
  domain_name = var.existing_domain_name != "" ? var.existing_domain_name : var.domain_name
  group_id    = var.existing_group_name != "" ? data.alicloud_dns_groups.this.ids[0] : concat(alicloud_dns_group.this.*.id, [""])[0]

  existing_domain = var.existing_domain_name != "" || var.create ? true : false
  this_dns_name   = var.existing_domain_name != "" ? var.existing_domain_name : concat(alicloud_dns.this.*.name, [""])[0]
  records         = length(var.records) > 0 ? var.records : var.record_list
}

################################
# dns_group
################################
resource "alicloud_dns_group" "this" {
  count = local.create_group ? 1 : 0
  name  = local.group_name
}

################################
# dns
################################
resource "alicloud_dns" "this" {
  count             = local.create ? 1 : 0
  name              = var.domain_name
  group_id          = local.group_id
  resource_group_id = var.resource_group_id != "" ? var.resource_group_id : null
}

################################
# dns_records
################################
resource "alicloud_dns_record" "this" {
  count = local.existing_domain && var.add_records ? length(local.records) : 0

  name        = local.this_dns_name
  host_record = lookup(local.records[count.index], "rr", "") != "" ? lookup(local.records[count.index], "rr") : lookup(local.records[count.index], "name")
  type        = lookup(local.records[count.index], "type", "A")
  ttl         = lookup(local.records[count.index], "ttl", 600)
  value       = lookup(local.records[count.index], "value")
  priority    = lookup(local.records[count.index], "priority")
  routing     = lookup(local.records[count.index], "line", "default")
}
