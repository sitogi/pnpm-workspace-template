# Variables for frontend infrastructure

variable "frontend_allowed_origins" {
  description = "List of allowed origins for CORS (for API if needed)"
  type        = list(string)
  default     = ["*"]
}

variable "frontend_cache_ttl" {
  description = "Default TTL for cached objects (in seconds)"
  type        = number
  default     = 3600
}

variable "frontend_price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_200" # Use PriceClass_100 for US/EU, PriceClass_200 adds Asia/Africa, PriceClass_All for global
}