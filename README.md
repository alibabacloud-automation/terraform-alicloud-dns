Alicloud Domain Name System (DNS) Terraform Module
terraform-alicloud-dns
=============================================

Terraform module which creates DNS resources on Alibaba Cloud.

These types of resources are supported:

* [DNS Group](https://www.terraform.io/docs/providers/alicloud/d/dns_groups.html)
* [DNS Domains](https://www.terraform.io/docs/providers/alicloud/d/dns_domains.html)
* [DNS Records](https://www.terraform.io/docs/providers/alicloud/d/dns_records.html)

Root module calls these modules which can also be used separately to create independent resources:

* [dns_group](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/modules/group) - creates groups
* [dns_domain](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/modules/domain) - creates domains
* [dns_record](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/modules/record) - creates records


`NOTE`:
* Domain (record) need follow RFC.

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


        module "record" {
          source      = "terraform-alicloud-modules/dns/alicloud"
          ttl         = "${var.record_ttl}"
          type        = "${var.record_type}"
          name        = "${var.record_name}"
          a_value     = "${var.a_value}"
          a_count     = "${var.a_count}"
          mx_priority = "${var.mx_priority}"
          domain_id   = "${module.domain.id}"
        }

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| group_list    | group list what you want to create    | list   | -  | no |
| group_count   | group list length                     | string | -  | no |
| domain_list   | domain list what you want to create   | list   | -  | no |
| group_name    | group name for 'domain_list'          | string | -  | no |
| domain_count  | domain list length                    | list   | -  | no |
| record_list   | record list                           | list   | -  | no |
| record_count  | record list length                    | string | -  | no |


## Outputs

| Name | Description |
|------|-------------|
| group_ids   | the id list of group  |
| group_names | group name list       |
| domain_names| domain name list      |
| record_info | record info list      |


Authors
-------
Created and maintained by Zeng Yichen(@microdustor easedust@aliyun.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
