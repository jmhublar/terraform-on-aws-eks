# Resource: EC2 Instance
variable "ami" {
  default = "ami-0742b4e673072066f"
}
resource "aws_instance" "myec2vm" {
  ami = var.ami
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}