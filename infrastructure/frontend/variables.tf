# =========================
# Azure Resource Settings
# =========================

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "cdn_endpoint_name" {
  description = "Name of the CDN endpoint"
  type        = string
}

variable "cdn_profile_name" {
  type = string
  description = "CDN profile name" 
}

variable "frontend_origin_urls" {
  type        = list(string)
  description = "List of allowed frontend origins for CORS, currently only 1"
}
