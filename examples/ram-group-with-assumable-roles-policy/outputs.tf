output "group_users" {
  description = "List of RAM users in RAM group"
  value       = module.ram-group-with-assumable-roles-policy-example.group_users
}

output "assumable_roles" {
  description = "List of ARNs of RAM roles which members of RAM group can assume"
  value       = module.ram-group-with-assumable-roles-policy-example.assumable_roles
}

output "policy_name" {
  description = "Assume role policy ARN of RAM group"
  value       = module.ram-group-with-assumable-roles-policy-example.policy_name
}

output "group_name" {
  description = "RAM group name"
  value       = module.ram-group-with-assumable-roles-policy-example.group_name
}
