# Create RAM groups with users who are allowed to assume RAM roles.

## Usage

```hcl
module "ram_group_with_assumable_roles_policy" {
    source  = "terraform-alicloud-modules/ram/alicloud//modules/ram-group-with-assumable-roles-policy"
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
| [alicloud_ram_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_group_policy_attachment) | resource |
| [alicloud_ram_policy.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_policy) | resource |
| [random_uuid.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action"></a> [action](#input\_action) | Operations on specific resources | `string` | `""` | no |
| <a name="input_assumable_roles"></a> [assumable\_roles](#input\_assumable\_roles) | List of RAM roles ARNs which can be assumed by the group | `list(string)` | `[]` | no |
| <a name="input_force"></a> [force](#input\_force) | This parameter is used for resource destroy | `bool` | `false` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Name of RAM group. If not set, a default name with prefix `group-assumable-roles-` will be returned. | `string` | `""` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of RAM policy, If not set, a default name with prefix `assumable-roles-policy-` will be returned. | `string` | `""` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | (Deprecated from version 1.3.0)The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD\_PROFILE environment variable. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | (Deprecated from version 1.3.0)The region used to launch this module resources. | `string` | `""` | no |
| <a name="input_shared_credentials_file"></a> [shared\_credentials\_file](#input\_shared\_credentials\_file) | (Deprecated from version 1.3.0)This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used. | `string` | `""` | no |
| <a name="input_skip_region_validation"></a> [skip\_region\_validation](#input\_skip\_region\_validation) | (Deprecated from version 1.3.0)Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet). | `bool` | `false` | no |
| <a name="input_user_names"></a> [user\_names](#input\_user\_names) | List of RAM users to have in an RAM group which can assume the role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_assumable_roles"></a> [this\_assumable\_roles](#output\_this\_assumable\_roles) | List of ARNs of RAM roles which members of RAM group can assume |
| <a name="output_this_group_name"></a> [this\_group\_name](#output\_this\_group\_name) | RAM group name |
| <a name="output_this_group_users"></a> [this\_group\_users](#output\_this\_group\_users) | List of RAM users in RAM group |
| <a name="output_this_policy_name"></a> [this\_policy\_name](#output\_this\_policy\_name) | Assume role policy ARN of RAM group |
<!-- END_TF_DOCS -->
