output "aws_ecr_repository" {
  value = aws_ecr_repository.aws-ecr.id
}

output "aws_ecs_cluster" {
  value = aws_ecs_cluster.aws-ecs-cluster.id
}

