terraform-alicloud-dns
======================

Terraform模块用于在阿里云上创建 [DNS](https://help.aliyun.com/product/29697.html)，同时您可以为其添加 records。

支持以下类型的资源：

* [DNS](https://www.terraform.io/docs/providers/alicloud/r/dns.html)
* [DNS Group](https://www.terraform.io/docs/providers/alicloud/r/dns_group.html)
* [DNS Records](https://www.terraform.io/docs/providers/alicloud/r/dns_record.html)

## 用法

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Adns&spm=docs.m.terraform-alicloud-modules.dns" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

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
本Module从版本v1.5.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/dns"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.4.0:

```hcl
module "dns" {
  source      = "terraform-alicloud-modules/dns/alicloud"
  version     = "1.4.0"
  region      = "cn-beijing"
  profile     = "Your-Profile-Name"
  domain_name = "dns001.abc"
  // ...
}
```

如果你想对正在使用中的Module升级到 1.5.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "dns" {
  source      = "terraform-alicloud-modules/dns/alicloud"
  domain_name = "dns001.abc"
  // ...
}
```
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "dns" {
  source      = "terraform-alicloud-modules/slb-http/alicloud"
  providers   = {
    alicloud = alicloud.bj
  }
  domain_name = "dns001.abc"
  // ...
}
```

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

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