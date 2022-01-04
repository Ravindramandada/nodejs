provider "aws" {
  region = var.region
}

locals {
  availability_zone = "${var.region}a"
  name              = var.name
  region            = var.region
  tags              = var.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
  cidr = var.vpc_cidr

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets


  tags = local.tags
}

data "aws_ami" "ami-00f7e5c52c0f43726" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = var.ingress_rules
  egress_rules        = ["all-all"]

  tags = local.tags
}

################################################################################
# EC2 Module
################################################################################

module "ec2" {
  source = "./modules/ec2_instance"

  name = local.name

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  availability_zone           = local.availability_zone
  subnet_id                   = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = local.tags
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2.id
}

resource "aws_ebs_volume" "this" {
  availability_zone = local.availability_zone
  size              = 1

  tags = local.tags
}
