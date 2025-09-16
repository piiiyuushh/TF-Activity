resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"   
  tags = { Name = "vpc" } 

}
resource "aws_eip" "nat_eip" {
  count = 2
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  count = 2
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id = aws_subnet.public[count.index].id
}

resource "aws_route" "internet" {
  route_table_id = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat[0].id
}

