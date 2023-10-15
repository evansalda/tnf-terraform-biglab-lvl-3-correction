resource "aws_lb" "front" {
  name               = "nuumfactory-biglab-${var.environnement}-lb-${var.digit}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

resource "aws_lb_target_group" "front" {
  name     = "nuumfactory-biglab-${var.environnement}-tg-${var.digit}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.big_lab.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front.arn
  }
}

resource "aws_autoscaling_attachment" "front" {
  autoscaling_group_name = aws_autoscaling_group.front.id
  lb_target_group_arn    = aws_lb_target_group.front.id
}