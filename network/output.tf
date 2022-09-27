output "vpc_id" {
  value = "${aws_vpc.myvpc.id}"
}

output "private_subnets" {
  value = "${aws_subnet.private[*].id}"
}

output "public_subnets" {
  value = "${aws_subnet.public[*].id}"
}

/*
output "ec2-instance" {
  value = aws_instance.web[*].id
}
*/


