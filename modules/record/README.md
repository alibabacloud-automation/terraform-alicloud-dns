# record

Creates DNS Domain. Accept list.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| record_list | Record list,  single element is map, need incloud name/ttl/type/value | list | - | yes |
| domain_name | Record`s domain name | string | "" | yes |


## Outputs

| Name | Description |
|------|-------------|
| records | Record information list |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
