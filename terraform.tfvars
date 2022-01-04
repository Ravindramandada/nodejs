name            = "demo-server"
region          = "us-west-2"

vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]

tags = {
  Owner       = "terraform"
  Environment = "dev"
}


instance_type       = "t2.micro"
key_name            = "demoone"				

ingress_cidr_blocks = ["0.0.0.0/0"]
ingress_rules       = ["http-80-tcp", "ssh-tcp", "all-icmp"]
 