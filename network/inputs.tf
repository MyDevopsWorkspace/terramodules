variable "region" {
  description = "specify the region"
  default        = "eu-west-2"
}

variable "vpc_cidr_range" {
 description = "CIDR range for the vpc"
 default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
 description = "enable_dns_hostnames"
 default = true
}

variable "enable_dns_support" {
 description = "enable_dns_hostnames"
 default = true
}

variable "private_subnets" {
 description = "list of private subnets"
 type = list(string)
 default = []
}

variable "private_subnets_az" {
 description = "list of azs where private subnets to be hosted"
 type = list(string)
 default = ["eu-west-2a","eu-west-2b"]
}

variable "public_subnets" {
 description = "list of public subnets"
 type = list(string)
 default = []
}

variable "public_subnets_az" {
 description = "list of azs where private subnets to be hosted"
 type = list(string)
 default = ["eu-west-2a","eu-west-2b"]
}

variable "vpc_name" {
  description = "specify the Name for the VPC"
  type = string
  default        = ""
}

variable "tags" {
  description = "tags for the VPC"
  type = map(string)
  default        = {}
}
