resource "aws_cloudwatch_log_group" "rentisafi" {
    name                = "ecs/rentisafi-${var.environment}"
    retention_in_days   = 30
}

resource "aws_cloudwatch_dashboard" "rentisafi" {
    dashboard_name = "rentisafi-${var.environment}"

    dashboard_body = jsonencode({
        widgets = [
            {
                type = "metric"
                width = 12
                height = 6

                properties = {
                    metrics = [
                        ["AWS/ECS", "CPUUtilization", "ServiceName", "rentisafi-backend"],
                        [".", "MemoryUtilization", ".", "."]
                    ]
                    period = 300
                    region = "us-east-1"
                    title = "ECS Metrics"
                }
            }
        ]
    })
}