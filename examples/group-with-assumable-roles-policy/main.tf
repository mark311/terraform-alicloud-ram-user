data "alicloud_account" "this" {
}

#########################
# Prepare 2 RAM users
#########################
resource "alicloud_ram_user" "prepared-user-1" {
  name = "tf-example-RGWARP-basic-prepared-user-1"
}

resource "alicloud_ram_user" "prepared-user-2" {
  name = "tf-example-RGWARP-basic-prepared-user-2"
}

######################################
# Prepare several ram assumable roles
######################################
resource "alicloud_ram_role" "prepared-role" {
  name        = "tf-example-RGWARP-basic-prepared-role"
  description = "tf-example-RGWARP-basic-prepared-role"
  document    = <<EOF
  {
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "apigateway.aliyuncs.com",
            "ecs.aliyuncs.com"
          ]
        }
      }
    ],
    "Version": "1"
  }
  EOF
}

#################################################################
# Create a ram group where user1 and user2 are allowed to assume
# the prepared roles.
#################################################################
module "ram-group-with-assumable-roles-policy-example" {
  source = "../../modules/group-with-assumable-roles-policy"

  group_name      = "tf-example-RGWARP-basic"
  policy_name     = "AliyunOSSFullAccess"

  assumable_roles = [
    alicloud_ram_role.prepared-role.arn,
  ]

  user_names = [
    alicloud_ram_user.prepared-user-1.name,
    alicloud_ram_user.prepared-user-2.name,
  ]
}
