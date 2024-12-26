output "this_group_users" {
  description = "List of RAM users in RAM group"
  value       = module.ram-group-with-assumable-roles-policy-example.this_group_users
}

output "this_assumable_roles" {
  description = "List of ARNs of RAM roles which members of RAM group can assume"
  value       = module.ram-group-with-assumable-roles-policy-example.this_assumable_roles
}

output "this_policy_name" {
  description = "Assume role policy ARN of RAM group"
  value       = module.ram-group-with-assumable-roles-policy-example.this_policy_name
}

output "this_group_name" {
  description = "RAM group name"
  value       = module.ram-group-with-assumable-roles-policy-example.this_group_name
}
