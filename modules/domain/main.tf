resource "alicloud_dns" "this" {
  	name						= "${element(var.domain_list, count.index)}"
  	count 						= "${var.domain_count}"
  	group_id					= "${var.group_id}"
}