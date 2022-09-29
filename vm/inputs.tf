variable "ami_id" {
  description = "ami"
  type        = string
  default = "ami-00785f4835c6acf64"
}

variable "instance_type" {
  description = "specify the instance type"
  type        = string
}

variable "tags" {
  description = "Default Tags for Auto Scaling Group"
  type        = map(string)
}

variable "subnetid" {
  description = "subnet to host the VM"
  type        = string
}