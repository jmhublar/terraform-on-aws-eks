# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  count = var.do_deploy_bastion ? 1 : 0
  depends_on = [ module.ec2_public, module.vpc ]
  instance = try(module.ec2_public.id, null)
  vpc      = true
  tags = local.common_tags
}

