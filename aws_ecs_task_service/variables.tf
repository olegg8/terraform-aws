variable "aws_region" {
    default = "eu-west-1"
}
variable "aws_ecs_task_family" {
    default = "service"
}
variable "aws_ecs_service_name" {
    default = "example-service"
}
variable "aws_tg_name" {}
variable "aws_ecs_cluster_name" {}
variable "aws_ecs_service_desired_count" {
    default ="1"
}
variable "aws_ecs_container_name" {
    default = "nginx"
}
variable "aws_ecs_container_port" {
    default = "80"
}
