#######################################
# Network Module
#######################################
module "network" {
  source = "./modules/network"

  vpc_cidr_block      = "10.0.0.0/16"
  vpc_name            = vpc
  nat_gateway_count   = 2
  public_subnet_ids   = var.public_subnet_ids
  main_route_table_id = var.main_route_table_id
}

#######################################
# IAM Module
#######################################
module "iam" {
  source = "./modules/iam"

  developer_user_name   = var.developer_user_name
  developer_user_path   = var.developer_user_path
  force_destroy_user    = var.force_destroy_user
  developer_policy_name = var.developer_policy_name
  developer_policy_json = var.developer_policy_json
  pgp_key               = var.pgp_key
}

#######################################
# Compute Module
#######################################
module "compute" {
  source = "./modules/compute"

  db_ami             = "ami-0abc12345deadbeef"
  db_instance_type   = var.db_instance_type
  db_public_ip       = var.db_public_ip
  app_ami            = "ami-0abc1234eadbe"
  app_instance_type  = var.app_instance_type
  app_instance_count = var.app_instance_count
  open_sg_id         = var.open_sg_id
}
