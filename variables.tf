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