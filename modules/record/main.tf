resource "alicloud_dns_record" "this" {
  name        = var.domain_name
  host_record = var.record_list[count.index]["name"]
  type        = var.record_list[count.index]["type"]
  ttl         = var.record_list[count.index]["ttl"]
  value       = var.record_list[count.index]["value"]
  priority    = var.record_list[count.index]["priority"]
  count       = length(var.record_list)
}

