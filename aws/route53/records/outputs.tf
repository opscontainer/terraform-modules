## Outputs

output "name" {
  value       = { for k, v in aws_route53_record.this : k => v.name }
  description = "name of the created route53 dns record"
}

output "fqdn" {
  value       = { for k, v in aws_route53_record.this : k => v.fqdn }
  description = "fully qualified domain name of the aws route53 dns record."
}

