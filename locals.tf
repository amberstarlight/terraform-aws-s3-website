locals {
  s3_origin_id              = "s3-website-origin"
  subject_alternative_names = var.subject_alternative_names == null ? ["*.${var.domain_name}"] : var.subject_alternative_names
}


data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = false
}

data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}
