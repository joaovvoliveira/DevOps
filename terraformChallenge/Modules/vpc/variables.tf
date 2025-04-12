variable "vpc_name" {}
variable "cidr_block" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "enable_nat_gateway" {
  type    = bool
  default = false
}