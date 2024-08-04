# route53 tf module

// We cannot set the argument `provider` inside the resource block.
// This is due to unambigous or bug detected on terraform during `terraform init` and `terraform validate`.
// Source: https://github.com/hashicorp/terraform/issues/28490#issuecomment-1103794241

resource "aws_route53_zone" "this" {
  for_each      = { for k, v in var.zone : k => v if var.create }
  name          = lookup(each.value, "dns", each.key)
  tags          = lookup(each.value, "tags", {})
  comment       = lookup(each.value, "comment", null)
  force_destroy = lookup(each.value, "force_destroy", false)

  delegation_set_id = lookup(each.value, "delegation_id", null)

  dynamic "vpc" {
    for_each = try(tolist(lookup(each.value, "vpc", [])), [lookup(each.value, "vpc", {})])

    content {
      vpc_id     = vpc.value.id
      vpc_region = vpc.value.region
    }
  }
}