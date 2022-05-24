output "aws_alb" {
    value = aws_alb.application_load_balancer.id
}

output "aws_lb_target_group" {
    value = aws_lb_target_group.target_group.id
}


output "aws_lb_listener" {
    value = aws_lb_listener.listener.id

}

output "target_group" {
  value = aws_lb_target_group.target_group.arn
}

output "aws_lb_sec_group" {
    value = aws_security_group.load_balancer_security_group.id

}

