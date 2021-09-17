Terraform module which create DNS on Alibaba Cloud.  
terraform-alicloud-dns
-------------------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/blob/master/README-CN.md)

Terraform module which creates [DNS](https://help.aliyun.com/product/29697.html) resources on Alibaba Cloud and add records.

These types of resources are supported:

* [DNS](https://www.terraform.io/docs/providers/alicloud/r/dns.html)
* [DNS Group](https://www.terraform.io/docs/providers/alicloud/r/dns_group.html)
* [DNS Record](https://www.terraform.io/docs/providers/alicloud/r/dns_record.html)

## Terraform versions

The Module requires Terraform 0.12 and Terraform Provider AliCloud 1.56.0+.

## Usage

### Create a DNS.

Create a DNS without any record.

```hcl
module "dns" {
  source        = "terraform-alicloud-modules/dns/alicloud"
  domain_name   = "dns001.abc"
}
``` 

Create a DNS and add the new group.

```hcl
module "dns" {
  source        = "terraform-alicloud-modules/dns/alicloud"
  domain_name   = "dns001.abc"
  create_group  = true
  group_name    = "dns-group"
}
``` 

Create a DNS and add records.

```hcl
module "dns" {
  source        = "terraform-alicloud-modules/dns/alicloud"
  domain_name   = "dns001.abc"
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
      ttl      = 600
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
``` 

### Operation of existing DNS.

Add records to existing domain.

```hcl
module "dns" {
  source               = "terraform-alicloud-modules/dns/alicloud"
  existing_domian_name = "dns002.abc"
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
      ttl      = 600
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
``` 

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
