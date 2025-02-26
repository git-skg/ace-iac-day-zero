provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = var.username
  password      = var.password
}

provider "aws" {
  alias  = "ohio"
  region = var.aws_spoke1_region
  access_key = "AKIAZDZTBZSV6LLQN6UL"
  secret_key = "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"
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
  subscription_id            = var.azure_subscription_id
  client_id                  = var.azure_client_id
  client_secret              = var.azure_client_secret
  tenant_id                  = var.azure_tenant_id
}
