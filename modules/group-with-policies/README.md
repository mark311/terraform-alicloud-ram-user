# Creates RAM group with specified RAM policies, and add users into a group.

## Usage

```hcl
module "ram_group_with_policy" {
    source  = "terraform-alicloud-modules/ram/alicloud//modules/ram-group-with-policies"
    version = "~> 1.2"

  # omitted...
}
```

<!-- 在根目录下运行命令 `terraform-docs markdown . --output-file "./README.md"`，可将所有信息自动填充 -->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_ram_group.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group) | resource |
| [alicloud_ram_group_membership.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_membership) | resource |
| [alicloud_ram_group_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_policy_attachment) | resource |
| [alicloud_ram_group_policy_attachment.custom_names](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_policy_attachment) | resource |
| [alicloud_ram_group_policy_attachment.managed_custom](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_policy_attachment) | resource |
| [alicloud_ram_group_policy_attachment.managed_system](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_policy_attachment) | resource |
| [alicloud_ram_group_policy_attachment.ram_self_management](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_policy_attachment) | resource |
| [alicloud_ram_policy.custom](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_policy) | resource |
| [alicloud_ram_policy.ram_self_management](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_policy) | resource |
| [random_uuid.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action"></a> [action](#input\_action) | Operations on specific resources | `list(string)` | `[]` | no |
| <a name="input_attach_ram_self_management_policy"></a> [attach\_ram\_self\_management\_policy](#input\_attach\_ram\_self\_management\_policy) | Whether to attach RAM policy which allows RAM users to manage their credentials and MFA | `bool` | `true` | no |
| <a name="input_comments"></a> [comments](#input\_comments) | Comment of the RAM group | `string` | `""` | no |
| <a name="input_create_group"></a> [create\_group](#input\_create\_group) | Whether to create RAM group | `bool` | `true` | no |
| <a name="input_custom_group_policies"></a> [custom\_group\_policies](#input\_custom\_group\_policies) | List of maps of inline RAM policies to attach to RAM group. Should have `name` and `documnet` keys in each element. | `list(map(string))` | `[]` | no |
| <a name="input_custom_group_policy_names"></a> [custom\_group\_policy\_names](#input\_custom\_group\_policy\_names) | List of RAM policies names to attach to RAM group | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the RAM policy | `string` | `""` | no |
| <a name="input_effect"></a> [effect](#input\_effect) | Authorization includes two types: Allow and Deny | `string` | `""` | no |
| <a name="input_force"></a> [force](#input\_force) | This parameter is used for resource destroy | `bool` | `false` | no |
| <a name="input_managed_custom_policy_names"></a> [managed\_custom\_policy\_names](#input\_managed\_custom\_policy\_names) | List of names of managed policies of Custom type to attach to RAM group | `list(string)` | `[]` | no |
| <a name="input_managed_system_policy_names"></a> [managed\_system\_policy\_names](#input\_managed\_system\_policy\_names) | List of names of managed policies of System type to attach to RAM group | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the RAM group. If not set, a default name with prefix `ram-group-` will be returned. | `string` | `""` | no |
| <a name="input_policy_type"></a> [policy\_type](#input\_policy\_type) | Type of the RAM policy | `string` | `"System"` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | (Deprecated from version 1.3.0)The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD\_PROFILE environment variable. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | (Deprecated from version 1.3.0)The region used to launch this module resources. | `string` | `""` | no |
| <a name="input_resource"></a> [resource](#input\_resource) | Authorized Specific Object | `list(string)` | `[]` | no |
| <a name="input_shared_credentials_file"></a> [shared\_credentials\_file](#input\_shared\_credentials\_file) | (Deprecated from version 1.3.0)This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used. | `string` | `""` | no |
| <a name="input_skip_region_validation"></a> [skip\_region\_validation](#input\_skip\_region\_validation) | (Deprecated from version 1.3.0)Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet). | `bool` | `false` | no |
| <a name="input_user_names"></a> [user\_names](#input\_user\_names) | List of user name which will be added to group | `list(string)` | `[]` | no |

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
