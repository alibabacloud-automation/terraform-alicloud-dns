resource "alicloud_dns_record" "this" {
    name                    = "${var.domain_name}"
    host_record             = "${lookup(var.record_list[count.index], "name")}"
    type                    = "${lookup(var.record_list[count.index], "type")}"
    ttl                     = "${lookup(var.record_list[count.index], "ttl")}"
    value                   = "${lookup(var.record_list[count.index], "value")}"
    priority                = "${lookup(var.record_list[count.index], "priority")}"
    count                   = "${length(var.record_list)}"
}