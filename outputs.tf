output "id" {
  description = "id"
  value       = try(aws_kms_key.this.id, "")
}

output "arn" {
  description = "arn"
  value       = try(aws_kms_key.this.arn, "")
}
