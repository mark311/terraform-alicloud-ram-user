module "ram-user-example" {
  source = "../.."

  user_name                     = "tf-example-ram-user-basic"
  create_ram_user_login_profile = false
  create_ram_access_key         = true
  managed_system_policy_names   = ["AliyunECSReadOnlyAccess", "AliyunRAMReadOnlyAccess"]
}
