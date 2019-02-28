resource "alicloud_dns_group" "this" {
  	name        						= "${element(var.group_list, count.index)}"
  	count       						= "${var.group_count}"
}