#############################
# Network module outputs
#############################
output "vpc_id" {
  description = "VPC ID from the network module"
  value       = module.network.vpc_id
}

output "nat_gateway_ids" {
  description = "NAT Gateway IDs from the network module"
  value       = module.network.nat_gateway_ids
}

output "nat_gateway_public_ips" {
  description = "NAT Gateway public IPs from the network module"
  value       = module.network.nat_gateway_public_ips
}

#############################
# IAM module outputs
#############################
output "developer_user_name" {
  description = "Developer IAM user name"
  value       = module.iam.developer_user_name
}

output "access_key_id" {
  description = "Access key ID for the IAM developer user"
  value       = module.iam.access_key_id
}

output "secret_access_key" {
  description = "Secret access key for the IAM developer user"
  value       = module.iam.secret_access_key
  sensitive   = true
}

#############################
# Compute module outputs
#############################
output "db_instance_id" {
  description = "Database instance ID"
  value       = module.compute.db_instance_id
}

output "app_instance_ids" {
  description = "Application instance IDs"
  value       = module.compute.app_instance_ids
}

output "app_public_ips" {
  description = "Application instance public IPs"
  value       = module.compute.app_public_ips
}
