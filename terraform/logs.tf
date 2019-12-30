# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "poke_log_group" {
  name              = "/ecs/poke-app"
  retention_in_days = 30

  tags = {
    Name = "poke-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "poke_log_stream" {
  name           = "poke-log-stream"
  log_group_name = aws_cloudwatch_log_group.poke_log_group.name
}
