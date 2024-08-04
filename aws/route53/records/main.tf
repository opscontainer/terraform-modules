locals {
  valid_types = [
    "A",
    "AAAA",
    "CAA",
    "CNAME",
    "DS",
    "MX",
    "NAPTR",
    "NS",
    "PTR",
    "SOA",
    "SPF",
    "SRV",
    "TXT"
  ]
}

// We cannot set the argument `provider` inside the resource block.
// This is due to unambigous or bug detected on terraform during `terraform init` and `terraform validate`.
// Source: https://github.com/hashicorp/terraform/issues/28490#issuecomment-1103794241

resource "aws_route53_record" "this" {
  for_each = { for index, value in flatten(var.record) : index => value if var.create }
  name     = lookup(each.value, "name", null)
  type     = contains(local.valid_types, lookup(each.value, "type", null)) ? lookup(each.value, "type", null) : null
  ttl      = length(keys(lookup(each.value, "alias", {}))) == 0 ? lookup(each.value, "ttl", null) : null
  zone_id  = lookup(each.value, "zone_id", null)

  dynamic "alias" {
    for_each = length(keys(lookup(each.value, "alias", {}))) == 0 ? [] : [true]

    content {
      name                   = each.value.alias.name
      zone_id                = lookup(each.value, "zone_id", null)
      evaluate_target_health = lookup(each.value.alias, "evaluate_health", false)
    }
  }

  records = try(lookup(each.value, "record", null), null)

  set_identifier = contains([
    "ip_based_policy",
    "failover_routing_policy",
    "geolocation_routing_policy"
  ], lookup(each.value, "identifier", null)) ? lookup(each.value, "identifier", null) : null

  health_check_id = lookup(each.value, "health_check_id", null)

  dynamic "cidr_routing_policy" {
    for_each = length(keys(lookup(each.value, "ip_based_policy", {}))) == 0 ? [] : [true]
    content {
      collection_id = lookup(each.value.ip_based_policy, "collection_id", null)
      location_name = lookup(each.value.ip_based_policy, "location_name", null)
    }
  }

  dynamic "failover_routing_policy" {
    for_each = length(keys(lookup(each.value, "failover_routing_policy", {}))) == 0 ? [] : [true]
    content {
      type = lookup(each.value.failover_routing_policy, "type", "PRIMARY")
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = length(keys(lookup(each.value, "geolocation_routing_policy", {}))) == 0 ? [] : [true]
    content {
      continent   = each.value.geolocation_routing_policy.country == null || each.value.geolocation_routing_policy.country == "" ? try(each.value.geolocation_routing_policy.continent, "AS") : null
      country     = each.value.geolocation_routing_policy.continent == null || each.value.geolocation_routing_policy.continent == "" ? tr(each.value.geolocation_routing_policy.country, "PH") : null
      subdivision = each.value.geolocation_routing_policy.country == null || each.value.geolocation_routing_policy.country == "" ? null : try(each.value.geolocation_routing_policy.subdivision, null)
    }
  }

  // TODO:support for the following routing policies 
  // - `geoproximity_routing_policy`
  // - `latency_routing_policy`
  // - `multivalue_answer_routing_policy`
  // - `weighted_routing_policy`

  allow_overwrite = lookup(each.value, "allow_overwrite", null)

}
