variable "region" {
  description = "Region to be used for EC2 instance"
  type        = string
  default     = "us-west-2"
}

variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = "demoone"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "Public Subnet Lists"
  type        = string
}

variable "public_subnets" {
  description = "Public Subnet Lists"
  type        = list(any)
  default     = []
}

variable "private_subnets" {
  description = "Private Subnet Lists"
  type        = list(any)
  default     = []
}


variable "ingress_cidr_blocks" {
  description = "Security Group Ingress IP Ranges"
  type        = list(any)
  default     = []
}

variable "ingress_rules" {
  description = "Port to be opened in Security Group"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}



