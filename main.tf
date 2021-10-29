terraform {
  
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "=2.81.0"
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
  version = "1.5.7"

  # insert required variables here
  location            = "westeurope"
  resource_group_name = "jummy-rg"
  vnet_name  = "jummy-vnet"
  app_name            = "jummy-poc"
  appplan_name        = "jummy-poc-app-plan"

  postgresql_server_name   = "jummy-poc-server"
  postgresql_database_name = "jummy-poc-db"
  postgresql_server_private_endpoint = "jummy-poc-server-endpoint"

  AssigmentCode = var.AssigmentCode
  Owner = var.Technical_Contact
  Technical_Contact = var.Technical_Contact
  Environment = var.Environment

}
