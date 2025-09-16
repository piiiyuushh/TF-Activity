#############################
# Network module variables
#############################



variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
  default     = []
}

variable "main_route_table_id" {
  description = "Main route table ID"
  type        = string
}

#############################
# IAM module variables
#############################
variable "developer_user_name" {
  description = "Name of the IAM developer user"
  type        = string
  default     = "dev-user"
}

variable "developer_user_path" {
  description = "Path for the IAM developer user"
  type        = string
  default     = "/"
}

variable "force_destroy_user" {
  description = "Force destroy the IAM user"
  type        = bool
  default     = true
}

variable "developer_policy_name" {
  description = "Name of the IAM user policy"
  type        = string
  default     = "dev-policy"
}

variable "developer_policy_json" {
  description = "Policy JSON for the IAM user"
  type        = string
  default     = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": "*",
    "Resource": "*"
  }]
}
EOT
}

variable "pgp_key" {
  description = "PGP key to encrypt the secret access key"
  type        = string
  default     = "none"
}

#############################
# Compute module variables
#############################


variable "db_instance_type" {
  description = "Instance type for the database instance"
  type        = string
  default     = "t2.micro"
}

variable "db_public_ip" {
  description = "Associate public IP for DB instance"
  type        = bool
  default     = true
}

variable "app_ami" {
  description = "AMI ID for the application instance"
  type        = string
  default     = "ami-0abc12345deadee"
}

variable "app_instance_type" {
  description = "Instance type for the application instance"
  type        = string
  default     = "t3.medium"
}

variable "app_instance_count" {
  description = "Number of application instances"
  type        = number
  default     = 1
}

variable "open_sg_id" {
  description = "Security group ID for the application instance"
  type        = string
}
