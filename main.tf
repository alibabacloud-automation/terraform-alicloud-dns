resource "alicloud_dns_group" "this" {
    name                                   = "${element(var.group_list, count.index)}"
    count                                  = "${var.group_count}"
}

resource "alicloud_dns" "this" {
    depends_on                             = ["alicloud_dns_group.this"]
    name                                   = "${element(var.domain_list, count.index)}"
    count                                  = "${var.domain_count}"
    group_id                               = "${data.alicloud_dns_groups.customer.groups.0.group_id}"
}

resource "alicloud_dns_record" "this" {
    depends_on                             = ["alicloud_dns.this"]
    name                                   = "${lookup(var.record_list[count.index], "domain_name")}"
    host_record                            = "${lookup(var.record_list[count.index], "name")}"
    type                                   = "${lookup(var.record_list[count.index], "type")}"
    ttl                                    = "${lookup(var.record_list[count.index], "ttl")}"
    value                                  = "${lookup(var.record_list[count.index], "value")}"
    count                                  = "${var.record_count}"
}