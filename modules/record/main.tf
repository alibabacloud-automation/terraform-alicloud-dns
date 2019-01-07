// add record "CNAME"
resource "alicloud_dns_record" "record_cname" {
  name        = "${var.domain_id[0]}"
  host_record = "${var.name["cname"]}"
  type        = "${var.type["cname"]}"
  ttl         = "${var.ttl}"
  value       = "www.aliyun.com"
}

// add record "A" with list
resource "alicloud_dns_record" "record_a" {
  count       = "${var.a_count}"
  name        = "${var.domain_id[0]}"
  host_record = "${var.name["a"]}"
  type        = "${var.type["a"]}"
  ttl         = "${var.ttl}"
  value       = "${lookup(var.a_value, count.index)}"
}


// add record "AAAA" 
resource "alicloud_dns_record" "record_aaaa" {
  name        = "${var.domain_id[0]}"
  host_record = "${var.name["aaaa"]}"
  type        = "${var.type["aaaa"]}"
  ttl         = "${var.ttl}"
  value       = "2001::1"
}

// add record "MX" 
resource "alicloud_dns_record" "record_mx" {
  name        = "${var.domain_id[0]}"
  host_record = "${var.name["mx"]}"
  type        = "${var.type["mx"]}"
  ttl         = "${var.ttl}"
  priority    = "${var.mx_priority}"
  value       = "mx.aliyun.com"
}