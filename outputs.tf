output "website_url" {
  description = "URL pública del sitio web"
  value       = aws_s3_bucket_website_configuration.portfolio.website_endpoint
}

output "bucket_arn" {
  description = "ARN del bucket, útil para referenciarlo en otros recursos"
  value       = aws_s3_bucket.portfolio.arn
}

output "bucket_name" {
  description = "Nombre del bucket, usado por deploy.sh"
  value       = aws_s3_bucket.portfolio.id
}
