resource "aws_ecs_service" "demo_service" {
  name            		= "demo-service"
  cluster         		= aws_ecs_cluster.my_cluster.id
  task_definition 		= aws_ecs_task_definition.demo_task.arn
  launch_type     		= "FARGATE"
  desired_count   		= 1

  load_balancer {
    target_group_arn 		= aws_lb_target_group.target_group.arn
    container_name   		= "demo-app"
    container_port   		= 8080
  }

  network_configuration {
    subnets          		= [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
    assign_public_ip 		= true
    security_groups             = [aws_security_group.ecs.id]
  }
}
