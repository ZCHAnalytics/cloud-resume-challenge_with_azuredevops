# =============================================================================
# Outputs: Cosmos DB & Azure Function Infrastructure
# Used by: GitHub Actions post-apply stage (output summary, downstream steps)
# =============================================================================

# -----------------------------------------------------------------------------
# Database Outputs
# -----------------------------------------------------------------------------

output "cosmosdb_endpoint" {
  value       = azurerm_cosmosdb_account.resume_cosmos.endpoint
  description = "The endpoint of the Cosmos DB account"
  # Used by: Function App env vars and GitHub summary
}

output "cosmosdb_primary_key" {
  value       = azurerm_cosmosdb_account.resume_cosmos.primary_key
  sensitive   = true # Explicitly marked to avoid logging it
  description = "The primary key of the Cosmos DB account"
  # Used internally by Function App env vars; not printed to summary
}

# -----------------------------------------------------------------------------
# API Outputs
# -----------------------------------------------------------------------------

output "function_app_url" {
  value       = "https://${azurerm_linux_function_app.resume_function.default_hostname}"
  description = "The URL of the Function App"
  # Used by:  API client calls
}

output "function_app_name" {
  value       = azurerm_linux_function_app.resume_function.name
  description = "The name of the Function App"
  # Informational
}

output "application_insights_key" {
  value       = azurerm_application_insights.resume_insights.instrumentation_key
  description = "Application Insights Instrumentation Key"
  sensitive   = true
  # Used by: Function App diagnostics, not printed to summary
}

output "api_endpoint" {
  value       = "https://${azurerm_linux_function_app.resume_function.default_hostname}/api/VisitorCounter"
  description = "Fully qualified API endpoint for the VisitorCounter function"
  # Useful for integration testing or front-end config
}

# -----------------------------------------------------------------------------
# Frontend Remote State Outputs
# -----------------------------------------------------------------------------

output "resource_group_name" {
  value = data.terraform_remote_state.frontend.outputs.resource_group_name
}

output "storage_account_name" {
  value = data.terraform_remote_state.frontend.outputs.storage_account_name
}

output "cdn_profile_name" {
  value = data.terraform_remote_state.frontend.outputs.cdn_profile_name
}

output "cdn_endpoint_name" {
  value = data.terraform_remote_state.frontend.outputs.cdn_endpoint_name
}

output "cdn_endpoint_url" {
  value       = data.terraform_remote_state.frontend.outputs.cdn_endpoint_url
  description = "CDN endpoint URL from frontend"
}

output "location" {
  value = data.terraform_remote_state.frontend.outputs.location
}
