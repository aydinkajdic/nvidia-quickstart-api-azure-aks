terraform {
  backend "azurerm" {
    resource_group_name  = "RG-AK-AI-DEV-NE-001"
    storage_account_name = "stgautomationfortaoapi"
    container_name       = "automation-for-tao-api"
    key                  = "terraform.tfstate"
  }
}