provider "aws" {
  region     = "${var.aws_region}"
}

data "aws_lb_target_group" "tg" {
  name = "${var.aws_tg_name}"
}

data "aws_ecs_cluster" "ecs-cluster" {
  cluster_name = "${var.aws_ecs_cluster_name}"
}

resource "aws_ecs_task_definition" "app" {
  family                = "${var.aws_ecs_task_family}"
  container_definitions = "${file("example-app.json")}"
}

resource "aws_ecs_service" "service" {
  name            = "${var.aws_ecs_service_name}"
  cluster         = "${data.aws_ecs_cluster.ecs-cluster.arn}"
  task_definition = "${aws_ecs_task_definition.app.arn}"
  desired_count   = "${var.aws_ecs_service_desired_count}"
  
  load_balancer {
    target_group_arn = "${data.aws_lb_target_group.tg.arn}"
    container_name = "${var.aws_ecs_container_name}"
    container_port = "${var.aws_ecs_container_port}"
  }

}