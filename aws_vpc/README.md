# terraform-aws / aws_vpc 
Sample terraform state to management aws pvc

# Requirements (on host that executes module)
> Terraform v0.11.1

# How to use
Edit input.auto.tfvars file and set variables:
> aws_region="eu-west-1"
> aws_vpc_name = "example-vpc"
> aws_vpc_cidr = "172.16.0.0/12" # Default 10.0.0.0/16

Run terraform:
> terraform init
> terraform plan
> terraform apply

To destroy run:
> terraform destroy