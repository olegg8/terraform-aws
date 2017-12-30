### aws_ecs_cluster

*Simple terraform state to create aws auto scaling group with application load balancer and attach to elastic container services. (You can also create asg without ecs cluster)*

# Requirements
> Terraform v0.11.1

# Defaults and Variables

**In variables.tf file seted default variables.**
```sh
variable "aws_region" {
    default = "eu-west-1"
}
variable "aws_tg_name" {
    default = "example-tg"
}
variable "aws_vpc_id" {}
variable "aws_sg" {}
variable "aws_alb_name" {
    default = "example-alb"
}
variable "aws_ecs" {
    default = "False"
}
variable "aws_ecs_cluster_name" {
    default = "example-ecs-cluster"
}
variable "aws_lc_name" {
    default = "example-lc"
}
variable "aws_instance_type" {
    default = "t2.micro"
}
variable "aws_ami_id" {
    default = "ami-4cbe0935"
}
variable "aws_ssh_key" {
    default = "example-eu-west-1"
}
variable "aws_iam_role" {
    default = ""
}
variable aws_asg_name {
    default = "example-asg"
}

variable "aws_tg_port" {
    default = "80"
}
variable "aws_tg_protocol" {
    default = "HTTP"
}
variable "aws_tg_path" {
    default = "/"
}
variable "aws_tg_interval" {
    default = "5"
}
variable "aws_tg_timeout" {
    default = "3"
}

variable "aws_alb_listen_port" {
    default = "80"
}
variable "aws_alb_protocol" {
    default = "HTTP"
}
variable "aws_alb_type" {
    default = "forward"
}

variable "aws_asg_min_size" {
    default = "1"
}
variable "aws_asg_max_size" {
    default = "2"
}
variable "aws_asg_desired_capacity" {
    default = "1"
}
variable "aws_asg_health_check_type" {
    default = "EC2"
}
```

**To change defaults and set requirement vars, edit input.auto.tfvars**
**For example:**
```sh
aws_vpc_id = "vpc-39e4045f"
aws_sg = "sg-b96e40c2"
#If you set aws_ecs in to False, does not created ecs cluster
#aws_iam_role = "ecsInstanceRole" need if you set aws_ecs = "True"
aws_ecs = "True"
aws_iam_role = "ecsInstanceRole"
```

#How to use

**Export enviroment variables with AWS credentials:**
```sh
export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID 
export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
```

**Run terraform:**
```sh
terraform init
terraform apply
```

**To destroy:**
```sh
terraform destroy
```
