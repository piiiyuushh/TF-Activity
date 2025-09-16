variable "db_ami" {
  description = "AMI ID for the database instance"
  type        = string
  default     = "ami-0abc12345deadbeef"
}

variable "db_instance_type" {
  description = "Instance type for the database instance"
  type        = string
  default     = "t2.micro"
}

variable "db_public_ip" {
  description = "Whether to associate a public IP with the database instance"
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
  description = "Security group ID for the application instances"
  type        = string
}
