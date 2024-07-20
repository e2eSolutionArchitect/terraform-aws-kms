# -------------------------------------------
# Common Variables
# -------------------------------------------
variable "kms_name" {
  description = "kms_name KEY Name"
  type        = string
  default     = null
}

variable "kms_alias" {
  description = "kms_alias"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}

variable "enable_key_rotation" {
  description = "enable_key_rotation"
  type        = bool
  default     = true
}

variable "deletion_window_in_days" {
  description = "deletion_window_in_days"
  type        = number
  default     = 20
}

variable "is_enabled" {
  description = "is_enabled"
  type        = string
  default     = true
}