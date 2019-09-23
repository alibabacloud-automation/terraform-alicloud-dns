resource "alicloud_dns_group" "this" {
  name  = var.group_list[count.index]
  count = length(var.group_list) > var.group_count ? var.group_count : length(var.group_list)
}

