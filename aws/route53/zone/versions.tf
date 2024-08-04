terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.15.0"
      configuration_aliases = [aws.route53_zone]
    }
  }
}
