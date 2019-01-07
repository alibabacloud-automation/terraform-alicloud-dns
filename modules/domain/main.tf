// add zone
resource "alicloud_dns" "dns" {
  name        = "${var.name[0]}"
  group_id    = "${var.group[0]}"
}