# RAM group with assumable roles policy example

Configuration in this directory creates RAM group with users who are allowed to assume RAM roles.


# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- 在根目录下运行命令 `terraform-docs markdown . --output-file "./README.md"`，可将所有信息自动填充 -->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ram_assumable_role_custom"></a> [ram\_assumable\_role\_custom](#module\_ram\_assumable\_role\_custom) | ../../modules/ram-assumable-role | n/a |
| <a name="module_ram_assumable_roles_in_prod"></a> [ram\_assumable\_roles\_in\_prod](#module\_ram\_assumable\_roles\_in\_prod) | ../../modules/ram-assumable-roles | n/a |
| <a name="module_ram_group_with_assumable_roles_policy_production_admin"></a> [ram\_group\_with\_assumable\_roles\_policy\_production\_admin](#module\_ram\_group\_with\_assumable\_roles\_policy\_production\_admin) | ../../modules/ram-group-with-assumable-roles-policy | n/a |
| <a name="module_ram_group_with_assumable_roles_policy_production_custom"></a> [ram\_group\_with\_assumable\_roles\_policy\_production\_custom](#module\_ram\_group\_with\_assumable\_roles\_policy\_production\_custom) | ../../modules/ram-group-with-assumable-roles-policy | n/a |
| <a name="module_ram_group_with_assumable_roles_policy_production_readonly"></a> [ram\_group\_with\_assumable\_roles\_policy\_production\_readonly](#module\_ram\_group\_with\_assumable\_roles\_policy\_production\_readonly) | ../../modules/ram-group-with-assumable-roles-policy | n/a |
| <a name="module_ram_user1"></a> [ram\_user1](#module\_ram\_user1) | ../../modules/ram-user | n/a |
| <a name="module_ram_user2"></a> [ram\_user2](#module\_ram\_user2) | ../../modules/ram-user | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_account.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_ram_policies.custom](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ram_policies) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_assumable_roles"></a> [this\_assumable\_roles](#output\_this\_assumable\_roles) | List of ARNs of RAM roles which members of RAM group can assume |
| <a name="output_this_group_name"></a> [this\_group\_name](#output\_this\_group\_name) | RAM group name |
| <a name="output_this_group_users"></a> [this\_group\_users](#output\_this\_group\_users) | List of RAM users in RAM group |
| <a name="output_this_policy_name"></a> [this\_policy\_name](#output\_this\_policy\_name) | Assume role policy ARN of RAM group |
<!-- END_TF_DOCS -->
