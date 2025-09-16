output "db_instance_id" {
  description = "ID of the database instance"
  value       = aws_instance.db.id
}

output "db_public_ip" {
  description = "Public IP address of the database instance"
  value       = aws_instance.db.public_ip
}

output "app_instance_ids" {
  description = "IDs of the application instances"
  value       = aws_instance.app[*].id
}

output "app_public_ips" {
  description = "Public IP addresses of the application instances"
  value       = aws_instance.app[*].public_ip
}
