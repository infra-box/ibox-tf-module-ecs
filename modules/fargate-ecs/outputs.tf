output "service" {
  value = aws_ecs_service.default
}
output "service_arn" {
  value = aws_ecs_service.default
}

output "service_discovery_service_id" {
  value = aws_service_discovery_service.this.id
}
output "service_discovery_service_name" {
  value = aws_service_discovery_service.this.name
}
output "service_task_definition" {
  value = aws_ecs_task_definition.default.arn
}