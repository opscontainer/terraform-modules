<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | whether to create route53 zone | `bool` | `true` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | whether route53 hosted zone will be public or private | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_name"></a> [route53\_name](#output\_route53\_name) | name of Route53 zone |
| <a name="output_route53_ns_servers"></a> [route53\_ns\_servers](#output\_route53\_ns\_servers) | ns servers of route53 zone |
| <a name="output_route53_static_zone_name"></a> [route53\_static\_zone\_name](#output\_route53\_static\_zone\_name) | Name of Route53 zone created statically to avoid invalid count argument error when creating records and zones simmultaneously |
| <a name="output_route53_zone_arn"></a> [route53\_zone\_arn](#output\_route53\_zone\_arn) | arn of route53 zone |
| <a name="output_route53_zone_id"></a> [route53\_zone\_id](#output\_route53\_zone\_id) | zone id of route53 zone |
<!-- END_TF_DOCS -->