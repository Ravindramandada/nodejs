resource "aws_ecs_task_definition" "demo_task" {
  family                   = "demo-task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "demo-app",
      "image": "${var.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 8080,
          "hostPort": 8080
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"] 
  network_mode             = "awsvpc"  
  memory                   = 512   
  cpu                      = 256    
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}
