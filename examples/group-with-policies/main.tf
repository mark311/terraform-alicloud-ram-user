resource "alicloud_ram_policy" "custom-policy-1" {
  policy_name     = "tf-example-RGWP-basic-custom-policy-1"
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
  name = "tf-example-RGWP-basic-prepared-user-1"
}

resource "alicloud_ram_user" "prepared-user-2" {
  name = "tf-example-RGWP-basic-prepared-user-2"
}

################################
# RAM group with managed policies attached
################################
module "ram-group-with-policies-example" {
  source = "../../modules/group-with-policies"

  group_name = "tf-example-RGWP-basic"

  managed_system_policy_names = ["AliyunECSReadOnlyAccess", "AliyunOSSReadOnlyAccess"]
  managed_custom_policy_names = [alicloud_ram_policy.custom-policy-1.policy_name]

  custom_group_policies = [
    {
      name   = "tf-example-RGWP-basic-custom-policy-2"
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
