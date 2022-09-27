output "ec2-instance" {
  value = aws_instance.web[*].id
}