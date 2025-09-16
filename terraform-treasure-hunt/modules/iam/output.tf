output "developer_user_name" {
  description = "Name of the IAM developer user"
  value       = aws_iam_user.developer.name
}

output "developer_policy_name" {
  description = "Name of the IAM policy attached to the developer user"
  value       = aws_iam_user_policy.dev_policy.name
}

output "access_key_id" {
  description = "Access key ID for the developer user"
  value       = aws_iam_access_key.dev_key.id
}

output "secret_access_key" {
  description = "Secret access key for the developer user (sensitive)"
  value       = aws_iam_access_key.dev_key.secret
  sensitive   = true
}
