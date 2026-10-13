output "website_url" {
  description = "URL pública del sitio (HTTPS)"
  value       = local.use_custom_domain ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "bucket_arn" {
  description = "ARN del bucket, útil para referenciarlo en otros recursos"
  value       = aws_s3_bucket.portfolio.arn
}

output "bucket_name" {
  description = "Nombre del bucket, usado por deploy.sh"
  value       = aws_s3_bucket.portfolio.id
}

output "cloudfront_domain" {
  description = "Dominio *.cloudfront.net de la distribución"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_distribution_id" {
  description = "ID de la distribución, usado por deploy.sh para invalidar caché"
  value       = aws_cloudfront_distribution.site.id
}
