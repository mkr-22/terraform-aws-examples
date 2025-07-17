variable "cidr_range" {
  type        = string
  description = "Default CIDR Range for VPC Creation and defauls to 10.0.0.0/16"
  default     = "10.0.0.0/16"
}

variable "private_subnet_map" {
  type        = map(string)
  description = "Map containing AZ and CIDR Range to create private subnets on given AZs"
}

variable "public_subnet_map" {
  type        = map(string)
  description = "Map containing AZ and CIDR Range to create public subnets on given AZs"
}