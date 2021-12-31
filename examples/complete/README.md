# Complete

Configuration in this directory creates DNS, add records.


# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

This example provides the tf variables file in the folder `tfvars`. If you want to create or update this example,
you can run this example as the following commands:
```bash
$ terraform plan -var-file=tfvars/01-update.tfvars
$ terraform apply -var-file=tfvars/01-update.tfvars
```

Also, you can add more variables files in the folder `tfvars`.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs
| Name | Description |
|------|-------------|
| this_domain_name | The name of domain |
| this_domain_records | List of the domain records |
| this_group_id | Id of the group in which the domain will add |
| this_group_name | Name of the group in which the domain will add |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
