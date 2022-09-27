resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
  subnet_id = var.subnetid
}