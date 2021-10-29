terraform {
  
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "=2.46.0"
    }
  }

  required_version = ">= 0.14"

   backend "remote" {
    organization = "Volvo-DevSecOps-POC"

    workspaces {
      name = "Azure-managed-POC-PROD"
    }
  }
  
}

 

module "pass" {

  source  = "app.terraform.io/Volvo-DevSecOps-POC/pass/volvo"
  version = "1.5.5"

  # insert required variables here
  location            = "westeurope"
  resource_group_name = "jumm-rg"
  vnet_name  = "jumm-vnet"
  app_name            = "jumm-poc"
  appplan_name        = "jumm-poc-app-plan"

  postgresql_server_name   = "jumm-poc-server"
  postgresql_database_name = "jumm-poc-db"
  postgresql_server_private_endpoint = "jumm-poc-server-endpoint"

  AssigmentCode = var.AssigmentCode
  Owner = var.Technical_Contact
  Technical_Contact = var.Technical_Contact
  Environment = var.Environment

}
