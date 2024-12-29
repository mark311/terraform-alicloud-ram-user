locals {
  resource_name_prefix = "tfmod-ram-user-ram-group"
}

resource "alicloud_ram_user" "default" {
  count = 2
  name  = "${local.resource_name_prefix}-user-${count.index + 1}"
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

resource "alicloud_ram_policy" "custom-policy-2" {
  policy_name     = "${local.resource_name_prefix}-custom-policy-2"
  policy_document = <<EOF
	{
		"Version": "1",
		"Statement": [
		  {
			"Action": "ots:*",
			"Resource": "*",
			"Effect": "Allow"
		  }
		]
	  }
	EOF
}

resource "alicloud_ram_policy" "custom-policy-3" {
  policy_name     = "${local.resource_name_prefix}-custom-policy-3"
  policy_document = <<EOF
	{
		"Version": "1",
		"Statement": [
		  {
			"Action": "ots:*",
			"Resource": "*",
			"Effect": "Allow"
		  }
		]
	  }
	EOF
}


module "ram-group" {
  source = "../../modules/ram-group"

  ################################
  # RAM group
  ################################
  group_name = "${local.resource_name_prefix}-example-group"
  comments   = "this is a test ram group"

  ################################
  # RAM group membership
  ################################
  # before joining the RAM group, make sure the RAM user has been created.
  user_names = alicloud_ram_user.default.*.name

  ################################
  # RAM group policy attachements
  ################################
  create_group_attachment = true
  policies = [
    # Binding a system policy.
    {
      policy_names = join(",", ["AliyunVPCFullAccess", "AliyunKafkaFullAccess"])
      policy_type  = "System"
    },
    # When binding custom policy, make sure this policy has been created.
    {
      policy_names = alicloud_ram_policy.custom-policy-1.policy_name
      policy_type  = "Custom"
    },
    # Create policy and bind the ram group.
    {
      policy_names = join(",", [
        alicloud_ram_policy.custom-policy-2.policy_name,
        alicloud_ram_policy.custom-policy-3.policy_name,
      ])
    }
  ]
}
