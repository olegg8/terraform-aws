provider "aws" {
  region     = "${var.aws_region}"
}

data "aws_availability_zones" "az" {}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = "${var.aws_vpc_id}"
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "${var.aws_tg_name}"
  port     = "${var.aws_tg_port}"
  protocol = "${var.aws_tg_protocol}"
  vpc_id   = "${var.aws_vpc_id}"

  health_check {
      path = "${var.aws_tg_path}"
      port = "${var.aws_tg_port}"
      protocol = "${var.aws_tg_protocol}"
      interval = "${var.aws_tg_interval}"
      timeout = "${var.aws_tg_timeout}"

  }
}

resource "aws_lb" "aws_alb" {
  name            = "${var.aws_alb_name}"
  internal        = false
  security_groups = ["${var.aws_sg}"]
  subnets         = ["${data.aws_subnet_ids.subnet_ids.ids}"]

  enable_deletion_protection = false
  load_balancer_type = "application"

  tags {
    Environment = "production"
  }
}

resource "aws_lb_listener" "alb_production" {
  load_balancer_arn = "${aws_lb.aws_alb.arn}"
  port              = "${var.aws_alb_listen_port}"
  protocol          = "${var.aws_alb_protocol}"
  
  default_action {
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
    type             = "${var.aws_alb_type}"
  }
}

resource "aws_ecs_cluster" "ecs_cluster" {
  count = "${var.aws_ecs ? 1 : 0}"
  name = "${var.aws_ecs_cluster_name}"
}


data "template_file" "ecs_user_data" {
  
  template = "${file("ecs_user_data.sh")}"

  vars {
    clustername = "${var.aws_ecs_cluster_name}"
  }
}

data "template_file" "user_data" {
  
  template = "${file("user_data.sh")}"

}

resource "aws_launch_configuration" "aws_lc" {
  name          = "${var.aws_lc_name}"
  image_id      = "${var.aws_ami_id}"
  instance_type = "${var.aws_instance_type}"
  key_name = "${var.aws_ssh_key}"
  security_groups = ["${var.aws_sg}"]
  iam_instance_profile = "${var.aws_iam_role}"
  associate_public_ip_address = "True"
  user_data = "${var.aws_ecs == "True" ? "${data.template_file.ecs_user_data.rendered}" : "${data.template_file.user_data.rendered}"}"
  

}

resource "aws_autoscaling_group" "aws_asg" {
  name                 = "${var.aws_asg_name}"
  launch_configuration = "${aws_launch_configuration.aws_lc.name}"
  min_size             = "${var.aws_asg_min_size}"
  max_size             = "${var.aws_asg_max_size}"
  desired_capacity     = "${var.aws_asg_desired_capacity}"
  availability_zones   = ["${data.aws_availability_zones.az.names}"]
  health_check_type    = "${var.aws_asg_health_check_type}"
  vpc_zone_identifier  = ["${data.aws_subnet_ids.subnet_ids.ids}"]
  target_group_arns    = ["${aws_lb_target_group.alb_target_group.arn}"]

  lifecycle {
    create_before_destroy = true
  }
}


