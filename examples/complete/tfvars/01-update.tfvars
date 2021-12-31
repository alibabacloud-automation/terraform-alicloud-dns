# dns_group
group_name = "update-dns-group"

# dns_records
records = [
  {
    rr       = "cname"
    type     = "CNAME"
    ttl      = 1200
    value    = "cname.aliyun.com"
    priority = 2
    line     = "telecom"
  }
]