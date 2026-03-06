resource "aws_instance" "this" {
  # Ini AMI Ubuntu 24.04 di region Jakarta
  # sengaja dihardcode
  ami                    = "ami-01739e23aa37af88a"
  instance_type          = "t4g.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "ec2-instance-${var.env}"
    Env  = var.env
  }
}
