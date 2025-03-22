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

output "ssh_private_key_path" {
  description = "Path to the SSH private key file"
  value       = local_file.bastion_private_key.filename
}

output "ssh_connection_command" {
  description = "Command to connect to the bastion host using SSH via SSM"
  value       = "ssh -i ${local_file.bastion_private_key.filename} ec2-user@${aws_instance.bastion.id} -o ProxyCommand='aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters portNumber=%p'"
}

output "ssh_config_entry" {
  description = "SSH config entry to add to ~/.ssh/config for easy connection to the bastion host"
  value       = <<-EOT
Host bastion
  HostName ${aws_instance.bastion.id}
  User ec2-user
  IdentityFile ${local_file.bastion_private_key.filename}
  ProxyCommand aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters portNumber=%p
EOT
}

output "nat_gateway_ip" {
  description = "Public IP address of the NAT Gateway"
  value       = aws_eip.nat.public_ip
}