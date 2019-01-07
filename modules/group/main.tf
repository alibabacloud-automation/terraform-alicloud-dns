// add group
resource "alicloud_dns_group" "group" {
  name        = "${lookup(var.group_name, count.index)}"
  count       = "${var.group_count}"
}