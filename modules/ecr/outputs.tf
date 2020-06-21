output "ecr_url" {
  value = aws_ecr_repository.default.repository_url
}
output "ecr_url_replica" {
  value = length(aws_ecr_repository.default_replica) > 0 ? aws_ecr_repository.default_replica[0].repository_url : null
}
