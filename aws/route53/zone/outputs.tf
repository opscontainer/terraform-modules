output "route53_zone_id" {
  description = "zone id of route53 zone"
  value       = { for k, v in aws_route53_zone.this : k => v.zone_id }
}

output "route53_zone_arn" {
  description = "arn of route53 zone"
  value       = { for k, v in aws_route53_zone.this : k => v.arn }
}

output "route53_ns_servers" {
  description = "ns servers of route53 zone"
  value       = { for k, v in aws_route53_zone.this : k => v.name_servers }
}

output "route53_name" {
  description = "name of Route53 zone"
  value       = { for k, v in aws_route53_zone.this : k => v.name }
}

output "route53_static_zone_name" {
  description = "Name of Route53 zone created statically to avoid invalid count argument error when creating records and zones simmultaneously"
  value       = { for k, v in var.zone : k => lookup(v, "domain_name", k) if var.create }
}