# Output values

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "bastion_instance_id" {
  description = "ID of the bastion EC2 instance"
  value       = aws_instance.bastion.id
}

output "ssm_connection_command" {
  description = "Command to connect to the bastion host using SSM"
  value       = "aws ssm start-session --target ${aws_instance.bastion.id}"
}

output "nat_gateway_ip" {
  description = "Public IP address of the NAT Gateway"
  value       = aws_eip.nat.public_ip
}