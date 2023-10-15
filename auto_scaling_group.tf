resource "aws_launch_template" "php_app" {
  image_id      = "ami-0f15e0a4c8d3ee5fe"
  instance_type = var.ec2_type
  user_data     = base64encode(data.template_file.front_user_data.rendered)

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.front.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "nuumfactory-biglab-${var.environnement}-ec2-${var.digit}"
    }
  }
}

data "template_file" "front_user_data" {
  template = file("${path.module}/user_data.tftpl")
  vars = {
    memcached_cluster_address = aws_elasticache_cluster.memcached.cluster_address,
    memcached_cluster_port    = aws_elasticache_cluster.memcached.port
  }
}

resource "aws_autoscaling_group" "front" {
  name                = "nuumfactory-biglab-${var.environnement}-asg-${var.digit}"
  min_size            = 2
  max_size            = 10
  vpc_zone_identifier = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  health_check_type   = "ELB"

  launch_template {
    id      = aws_launch_template.php_app.id
    version = aws_launch_template.php_app.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}