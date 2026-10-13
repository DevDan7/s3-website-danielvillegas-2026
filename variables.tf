variable "bucket_name" {
  description = "Nombre único global del bucket S3"
  type        = string
  default     = "proyecto-s3-website-danelvillegas-2026"
}

variable "aws_region" {
  description = "Región donde vive el bucket"
  type        = string
  default     = "us-east-1"
}

variable "index_document" {
  description = "Archivo que se sirve como página principal"
  type        = string
  default     = "index.html"
}
variable "domain_name" {
  description = "Dominio propio (ej. danielvillegas.dev). Vacío = usar el dominio *.cloudfront.net sin ACM"
  type        = string
  default     = ""
}

variable "price_class" {
  description = "Edge locations de CloudFront. PriceClass_All incluye São Paulo; PriceClass_100 solo EE.UU./Europa"
  type        = string
  default     = "PriceClass_All"
}
