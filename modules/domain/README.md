# domain

Creates DNS Domain. Accept list, all this domain need not belong to other user, and it must realy has been registered.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain_list | Domain name list | list | - | yes |
| domain_count | Domain name list length | string | - | yes |
| group_id | Domain`s group id | string | "" | no |


## Outputs

| Name | Description |
|------|-------------|
| name | domain name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
