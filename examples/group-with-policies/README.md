# RAM group with policies example

Configuration in this directory creates RAM group with users who has specified RAM policies.


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
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.236.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ram_group_superadmins"></a> [ram\_group\_superadmins](#module\_ram\_group\_superadmins) | ../../modules/ram-group-with-policies | n/a |
| <a name="module_ram_group_with_managed_policies_attached"></a> [ram\_group\_with\_managed\_policies\_attached](#module\_ram\_group\_with\_managed\_policies\_attached) | ../../modules/ram-group-with-policies | n/a |
| <a name="module_ram_user1"></a> [ram\_user1](#module\_ram\_user1) | ../../modules/ram-user | n/a |
| <a name="module_ram_user2"></a> [ram\_user2](#module\_ram\_user2) | ../../modules/ram-user | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ram_policy.custom-policy-1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_policy) | resource |
| [random_integer.default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_custom_description"></a> [this\_custom\_description](#output\_this\_custom\_description) | Description of custom policy |
| <a name="output_this_custom_policy_name"></a> [this\_custom\_policy\_name](#output\_this\_custom\_policy\_name) | RAM custom name |
| <a name="output_this_group_name"></a> [this\_group\_name](#output\_this\_group\_name) | RAM group name |
| <a name="output_this_group_users"></a> [this\_group\_users](#output\_this\_group\_users) | List of RAM users in RAM group |
| <a name="output_this_ram_self_management_policy_description"></a> [this\_ram\_self\_management\_policy\_description](#output\_this\_ram\_self\_management\_policy\_description) | Description of ram\_self\_management policy |
| <a name="output_this_ram_self_management_policy_name"></a> [this\_ram\_self\_management\_policy\_name](#output\_this\_ram\_self\_management\_policy\_name) | RAM ram\_self\_management policy name |
<!-- END_TF_DOCS -->
