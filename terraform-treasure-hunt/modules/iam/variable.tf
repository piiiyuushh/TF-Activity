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
  description = "Force destroy the IAM user when deleting"
  type        = bool
  default     = true
}

variable "developer_policy_name" {
  description = "Name of the IAM user policy"
  type        = string
  default     = "dev-policy"
}

variable "developer_policy_json" {
  description = "JSON policy document for the IAM user"
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
