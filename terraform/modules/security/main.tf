resource "aws_security_group" "ecs_tasks" {
    name = "rentisafi-ecs-tasks-${var.environment}"
    description = "Allow inbound traffic for ECS tasks"
    vpc_id = var.vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [aws_security.alb.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}