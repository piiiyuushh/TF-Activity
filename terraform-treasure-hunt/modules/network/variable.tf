variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "nat_gateway_count" {
  description = "Number of NAT Gateways / EIPs to create"
  type        = number
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for NAT Gateways"
  type        = list(string)
}

variable "main_route_table_id" {
  description = "Route table ID for default route"
  type        = string
}
