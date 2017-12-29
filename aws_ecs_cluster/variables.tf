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