variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "terraform_name"
}

variable "service" {
  description = "The specification of alicloud FC service."
  type        = string
  default     = ""
}

variable "memory_size" {
  description = "The specification  of oss memory size ."
  type        = number
  default     = 512
}

variable "runtime" {
  description = "The specification  of FC function runtime ."
  type        = string
  default     = "python2.7"
}

variable "handler" {
  description = "The specification  of FC function handler ."
  type        = string
  default     = "hello.handler"
}

variable "bucket_id" {
  description = "The specification  of oss bucket id ."
  type        = string
  default     = ""
}

variable "bucket_name" {
  description = "The specification  of oss bucket name ."
  type        = string
  default     = ""
}

variable "oss_key" {
  description = "The specification of oss key ."
  type        = string
  default     = ""
}

variable "regions" {
  description = "The specification of regions id."
  type        = string
  default     = ""
}

variable "account" {
  description = "The specification of account id."
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "The specification of role arn."
  type        = string
  default     = ""
}

variable "role_name" {
  description = "The specification of role name."
  type        = string
  default     = ""
}

variable "policy_name" {
  description = "The specification of policy name."
  type        = string
  default     = ""
}

variable "policy_type" {
  description = "The specification of policy type."
  type        = string
  default     = "Custom"
}
