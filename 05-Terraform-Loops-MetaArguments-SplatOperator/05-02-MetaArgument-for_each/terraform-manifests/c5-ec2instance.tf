# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  state = "available"
}

data "aws_ec2_instance_type" "t3_micro" {
  instance_type = "t3.micro"
}
data "aws_ec2_instance_type_offerings" "available" {
  filter {
    name   = "instance-type"
    values = [var.instance_type]
  }
  location_type = "availability-zone"
}

# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  # Create EC2 Instance in all Availability Zones where the instance type is offered
  for_each = {
    for az in toset(data.aws_availability_zones.my_azones.names) : az => az
    if contains(data.aws_ec2_instance_type_offerings.available.locations, az)
  }
  availability_zone = each.key
  tags = {
    "Name" = "for_each-Demo-${each.value}"
  }
}
