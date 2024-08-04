# route53 tf module

## Required Variables

variable "zone" {
  type        = any
  default     = {}
  description = "map of route53 zone parameters"
}

## Optional variables

variable "create" {
  type        = bool
  default     = true
  description = "whether to create route53 zone"
}
