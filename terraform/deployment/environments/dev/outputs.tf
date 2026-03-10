output "name_prefix" {
  value = local.name_prefix
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.app.arn
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.app.arn
}

output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.ecs.name
}

output "route53_name_servers" {
  value = aws_route53_zone.main.name_servers
}

output "certificate_arn" {
  value = aws_acm_certificate.app.arn
}

output "custom_domain" {
  value = "https://threatcomposer.suheyr.com"
}
