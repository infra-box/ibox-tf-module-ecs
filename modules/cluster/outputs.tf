output "cluster_id" {
  value = aws_ecs_cluster.default.id
}

output "cluster_name" {
  value = aws_ecs_cluster.default.name
}

##### replication

output "replica_cluster_id" {
  value = aws_ecs_cluster.default_replica.*.id
}

output "replica_cluster_name" {
  value = aws_ecs_cluster.default_replica.*.name
}
