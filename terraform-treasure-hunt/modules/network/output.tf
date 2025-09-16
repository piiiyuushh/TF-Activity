output "vpc_id" {
  value = aws_vpc.main.id
}

output "nat_eip_ids" {
  value = aws_eip.nat_eip[*].id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.nat[*].id
}
