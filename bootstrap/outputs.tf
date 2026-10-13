output "state_bucket_name" {
  description = "Bucket a usar en el bloque backend \"s3\" del stack principal"
  value       = aws_s3_bucket.tfstate.id
}

output "state_bucket_arn" {
  description = "ARN del bucket de state, útil para acotar políticas IAM (p. ej. el rol OIDC de CI)"
  value       = aws_s3_bucket.tfstate.arn
}
