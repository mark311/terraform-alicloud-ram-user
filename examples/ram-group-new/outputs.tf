output "group_name" {
  description = "The name of group"
  value       = module.example.group_name
}

output "group_user_names" {
  description = "User name which has be added to group"
  value       = module.example.group_user_names
}

output "group_policy_name" {
  description = "The name of policy which bind to group"
  value       = module.example.group_policy_name
}
