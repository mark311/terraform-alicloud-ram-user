# RAM group
variable "create" {
  description = "Whether to create RAM group"
  type        = bool
  default     = true
}

variable "group_name" {
  description = "Name of the RAM group. If not set, a default name with prefix `ram-group-` will be returned."
  type        = string
  default     = ""
}

variable "comments" {
  description = "Comment of the RAM group"
  type        = string
  default     = ""
}

variable "force" {
  description = "This parameter is used for resource destroy"
  type        = bool
  default     = false
}

# RAM group membership
variable "user_names" {
  description = "List of user name which will be added to group"
  type        = list(string)
  default     = []
}

# RAM group policy attachements
variable "attach_ram_self_management_policy" {
  description = "Whether to attach RAM policy which allows RAM users to manage their credentials and MFA"
  type        = bool
  default     = true
}

variable "policy_type" {
  description = "Type of the RAM policy"
  type        = string
  default     = "System"
}

variable "custom_group_policy_names" {
  description = "List of RAM policies names to attach to RAM group"
  type        = list(string)
  default     = []
}

variable "managed_custom_policy_names" {
  description = "List of names of managed policies of Custom type to attach to RAM group"
  type        = list(string)
  default     = []
}

variable "managed_system_policy_names" {
  description = "List of names of managed policies of System type to attach to RAM group"
  type        = list(string)
  default     = []
}

variable "custom_group_policies" {
  description = "List of maps of inline RAM policies to attach to RAM group. Should have `name` and `documnet` keys in each element."
  type        = list(map(string))
  default     = []
}

# RAM policies
variable "action" {
  description = "Operations on specific resources"
  type        = list(string)
  default     = []
}

variable "effect" {
  description = "Authorization includes two types: Allow and Deny"
  type        = string
  default     = ""
}

variable "resource" {
  description = "Authorized Specific Object"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Description of the RAM policy"
  type        = string
  default     = ""
}
