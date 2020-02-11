module "test" {
  source       = "../.."
  domain_name  = "dns001.abc"
  create_group = true
  group_name   = "dns-group"
  records = [
    {
      rr       = "www"
      type     = "A"
      ttl      = 600
      value    = "223.5.5.5"
      priority = 1
      line     = "default"
    },
    {
      rr       = "www"
      type     = "MX"
      ttl      = 1200
      value    = "mx.aliyun.com"
      priority = 1
    },
    {
      rr       = "cname"
      type     = "CNAME"
      ttl      = 600
      value    = "mx.aliyun.com"
      priority = 1
    }
  ]
}

