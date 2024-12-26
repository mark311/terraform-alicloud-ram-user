resource "random_uuid" "this" {
}

locals {
  group_name  = var.group_name != "" ? var.group_name : substr("group-assumable-roles-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}


# RAM group
resource "alicloud_ram_group" "this" {
  count = var.create ? 1 : 0

  name     = local.group_name
  comments = var.comments != "" ? var.comments : null
  force    = var.force
}

# RAM group membership
resource "alicloud_ram_group_membership" "this" {
  count = length(var.user_names) > 0 ? 1 : 0

  group_name = local.group_name
  user_names = var.user_names
}

# RAM group policy attachements
resource "alicloud_ram_group_policy_attachment" "ram_self_management" {
  count = (var.attach_ram_self_management_policy && length(var.action) > 0) ? 1 : 0

  group_name  = local.group_name
  policy_name = alicloud_ram_policy.ram_self_management[0].policy_name
  policy_type = "Custom"
}

resource "alicloud_ram_group_policy_attachment" "custom_names" {
  count = length(var.custom_group_policy_names) > 0 ? length(var.custom_group_policy_names) : 0

  group_name  = local.group_name
  policy_name = element(var.custom_group_policy_names, count.index)
  policy_type = "Custom"
}

resource "alicloud_ram_group_policy_attachment" "custom" {
  count = length(var.custom_group_policies) > 0 ? length(var.custom_group_policies) : 0

  group_name  = local.group_name
  policy_name = element(alicloud_ram_policy.custom.*.policy_name, count.index)
  policy_type = "Custom"
}

# RAM policies
resource "alicloud_ram_policy" "ram_self_management" {
  count = (var.attach_ram_self_management_policy && length(var.action) > 0) ? 1 : 0

  policy_name     = local.group_name
  policy_document = local.document
  description     = var.description != "" ? var.description : null
  force           = var.force
}

resource "alicloud_ram_policy" "custom" {
  count = length(var.custom_group_policies) > 0 ? length(var.custom_group_policies) : 0

  policy_name     = var.custom_group_policies[count.index].name
  policy_document = var.custom_group_policies[count.index].document
  description     = var.description != "" ? var.description : null
  force           = var.force
}

resource "alicloud_ram_group_policy_attachment" "managed_custom" {
  count = length(var.managed_custom_policy_names) > 0 ? length(var.managed_custom_policy_names) : 0

  group_name  = local.group_name
  policy_name = element(var.managed_custom_policy_names, count.index)
  policy_type = "Custom"
}

resource "alicloud_ram_group_policy_attachment" "managed_system" {
  count = length(var.managed_system_policy_names) > 0 ? length(var.managed_system_policy_names) : 0

  group_name  = local.group_name
  policy_name = element(var.managed_system_policy_names, count.index)
  policy_type = "System"
}
