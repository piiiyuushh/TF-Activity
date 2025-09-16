# resource "aws_vpc" "main" {
#   cidr_block = var.vpc_cidr_block
#   tags = {
#     Name = var.vpc_name
#   }
# }

# resource "aws_eip" "nat_eip" {
#   count = var.nat_eip_count
# }

# resource "aws_nat_gateway" "nat" {
#   count         = var.nat_eip_count
#   allocation_id = aws_eip.nat_eip[count.index].id
#   subnet_id     = var.public_subnet_ids[count.index]
# }

# resource "aws_route" "internet" {
#   route_table_id         = var.main_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat[0].id
# }

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_eip" "nat_eip" {
  count  = var.nat_gateway_count
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  count         = var.nat_gateway_count
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]
}

resource "aws_route" "internet" {
  route_table_id         = var.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}
