Alicloud Domain Name System (DNS) Terraform Module
terraform-alicloud-dns
=============================================

Terraform module which creates DNS resources on Alibaba Cloud.

These types of resources are supported:

* [DNS Group](https://www.terraform.io/docs/providers/alicloud/d/dns_groups.html)
* [DNS Domains](https://www.terraform.io/docs/providers/alicloud/d/dns_domains.html)
* [DNS Records](https://www.terraform.io/docs/providers/alicloud/d/dns_records.html)

Root module calls these modules which can also be used separately to create independent resources:

* [group](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/modules/group) - creates groups
* [domain](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/modules/domain) - creates domains
* [record](https://github.com/terraform-alicloud-modules/terraform-alicloud-dns/tree/master/modules/record) - creates records


`NOTE`:
* Domain (record) need follow RFC.

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


        module "dns" {
            source                      = "terraform-alicloud-modules/dns/alicloud"
            domain_name                 = "aliyun.com"
            record_list                 = [
                {
                    name                = "www"
                    type                = "A"
                    ttl                 = 600
                    value               = "223.5.5.5"
                    priority            = 1
                },
                {
                    name                = "www"
                    type                = "A"
                    ttl                 = 600
                    value               = "223.5.5.5"
                    priority            = 1
                }
            ]
            record_count                = 2
        }

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain_name   | domain name which you want to add                                   | list   | -  | yes |
| group_name    | group name which you want to add and set 'domain'`s group to it     | string | -  | no  |
| ds_group_name | data source group name ,if you want use extend group ,set this key  | list   | -  | no  |
| record_list   | record list                                                         | list   | -  | no  |
| record_count  | record list length                                                  | string | -  | no  |


## Outputs

| Name | Description |
|------|-------------|
| group_id    | the id of group       |
| domain_name | domain name           |
| records     | record info list      |


Authors
-------
Created and maintained by Zeng Yichen(@microdustor easedust@aliyun.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
