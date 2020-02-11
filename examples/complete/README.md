# NDS example

Configuration in this directory creates DNS, add records.


# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs
| Name | Description |
|------|-------------|
| this_domain_name | The name of domain |
| this_domain_records | List of the domain records |
| this_group_id | Id of the group in which the domain will add |
| this_group_name | Name of the group in which the domain will add |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
