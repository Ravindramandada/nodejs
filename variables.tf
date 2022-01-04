variable "region" {
  description = "Region to be used for EC2 instance"
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1b", "us-east-1c"]
}

variable "vpc_name" {
  description = "VPC Name to be Created"
  type        = string
  default     = ""
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


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


variable "repository_url" {
  description = "ECR Repo name"
  type        = string
  default     = ""
}



