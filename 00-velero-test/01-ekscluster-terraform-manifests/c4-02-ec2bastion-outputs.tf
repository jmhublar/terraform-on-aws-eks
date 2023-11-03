# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = try(module.ec2_public.id, null)
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "Elastic IP associated to the Bastion Host"
  value       = try(aws_eip.bastion_eip[0].public_ip, null)
}
