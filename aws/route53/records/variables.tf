## Required variables

variable "create" {
  type        = bool
  default     = true
  description = "whether to create route53 dns record."
}

variable "record" {
  type        = any
  description = "map of route53 dns records"
  default     = []
}


