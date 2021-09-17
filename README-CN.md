terraform-alicloud-dns
======================

Terraform模块用于在阿里云上创建 [DNS](https://help.aliyun.com/product/29697.html)，同时您可以为其添加 records。

支持以下类型的资源：

* [DNS](https://www.terraform.io/docs/providers/alicloud/r/dns.html)
* [DNS Group](https://www.terraform.io/docs/providers/alicloud/r/dns_group.html)
* [DNS Records](https://www.terraform.io/docs/providers/alicloud/r/dns_record.html)

## Terraform 版本

本 Module 要求使用 Terraform 0.12 和 阿里云 Provider 1.56.0+。

## 用法

### 创建一个新的 DNS

创建一个未添加解析记录的 DNS。

```hcl
module "dns" {
  source        = "terraform-alicloud-modules/dns/alicloud"
  domain_name   = "dns001.abc"
}
``` 

创建一个未添加解析记录的 DNS 并添加到新创建的 DNS 组中。

```hcl
module "dns" {
  source        = "terraform-alicloud-modules/dns/alicloud"
  domain_name   = "dns001.abc"
  create_group  = true
  group_name    = "dns-group"
}
``` 

创建一个 DNS 并添加解析记录。

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

### 操作已存在的DNS

对已存在的域名中添加解析记录。

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

## 示例

* [DNS 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

提交问题
-------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)