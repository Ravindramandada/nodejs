# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "App_DNS_Name" {
  description = "Application Domain Address"
  value       = aws_lb.application_load_balancer.dns_name
}

