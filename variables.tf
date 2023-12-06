variable "domain_name" {
  description = "URL of the website."
  type        = string
}

variable "aliases" {
  description = "List of aliases for this website."
  type        = list(string)
  default     = null
}

variable "subject_alternative_names" {
  description = "Alternative names to create certificates for."
  type        = list(string)
  default     = null
}

variable "redirect_index_html" {
  description = "Whether to automatically append `index.html` to requests using a CloudFront function."
  type        = bool
  default     = true
}

variable "price_class" {
  description = "100, 200, or `all`."
  type        = string

  validation {
    condition     = strcontains(var.price_class, "100") || strcontains(var.price_class, "200") || strcontains(var.price_class, "all")
    error_message = "price_class must be one of `100`, `200`, or `all`"
  }
}

variable "create_bucket" {
  description = "Whether to create the S3 bucket. Set to `false` to supply a pre-existing bucket."
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Name of the S3 bucket to use as the origin."
  type        = string
}
