# record

Creates DNS Domain. Accept list, all this domain need not belong to other user, and it must realy has been registered.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| record_list | Record list,  single element is map, need incloud name/ttl/type/value | list | - | yes |
| record_count | Record list length | string | - | yes |
| domain_name | Record`s domain name | string | "" | yes |


## Outputs

| Name | Description |
|------|-------------|
| records | Record information list |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
