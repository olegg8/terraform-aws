###aws_ecs_task_service

*Simple terraform state to create task definitions and service for aws ecs.*
*To create aws ecs cluster you can use [aws_ecs_cluster](https://github.com/unicanova/terraform-aws/tree/master/aws_ecs_cluster "aws_ecs_cluster") state*

#Requirements
> Terraform v0.11.1

# Defaults and Variables

**In variables.tf file seted default variables.**
```sh
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
```

**In example-app.json file, sample container specification**
```json
[
    {
      "name": "nginx",
      "image": "nginx",
      "cpu": 100,
      "memory": 512,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ]
    }
]
```

**To change defaults and set requirement vars, edit input.auto.tfvars**
**For example:**
```sh
aws_tg_name = "example-tg"
aws_ecs_cluster_name = "example-ecs-cluster"
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
