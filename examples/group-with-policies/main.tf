locals {
  resource_name_prefix = "tfmod-ram-user-group-with-policies"
}

resource "alicloud_ram_policy" "custom-policy-1" {
  policy_name     = "${local.resource_name_prefix}-custom-policy-1"
  policy_document = <<EOF
	{
		"Version": "1",
		"Statement": [
		  {
			"Action": "mns:*",
			"Resource": "*",
			"Effect": "Allow"
		  }
		]
	  }
	EOF
}

#########################
# Prepare 2 RAM users
#########################
resource "alicloud_ram_user" "prepared-user-1" {
  name = "${local.resource_name_prefix}-prepared-user-1"
}

resource "alicloud_ram_user" "prepared-user-2" {
  name = "${local.resource_name_prefix}-prepared-user-2"
}

################################
# RAM group with managed policies attached
################################
module "ram-group-with-policies-example" {
  source = "../../modules/group-with-policies"

  group_name = "${local.resource_name_prefix}-example"

  managed_system_policy_names = ["AliyunECSReadOnlyAccess", "AliyunOSSReadOnlyAccess"]
  managed_custom_policy_names = [alicloud_ram_policy.custom-policy-1.policy_name]

  custom_group_policies = [
    {
      name   = "${local.resource_name_prefix}-custom-policy-2"
      document = <<EOF
	{
		"Version": "1",
		"Statement": [
		  {
			"Action": "rds:*",
			"Resource": "*",
			"Effect": "Allow"
		  }
		]
	  }
	EOF
    },
  ]

  user_names = [
    alicloud_ram_user.prepared-user-1.name,
    alicloud_ram_user.prepared-user-2.name,
  ]
}
