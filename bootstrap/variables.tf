variable "state_bucket_name" {
  description = "Nombre único global del bucket que guarda el state remoto"
  type        = string
  default     = "danielvillegas-tfstate-2026"
}

variable "aws_region" {
  description = "Región del bucket de state"
  type        = string
  default     = "us-east-1"
}

variable "noncurrent_version_days" {
  description = "Días que se conservan las versiones antiguas del state"
  type        = number
  default     = 90
}
