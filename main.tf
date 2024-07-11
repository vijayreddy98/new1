terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }

   
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "sttesttf"
    container_name       = "tfbackend"
    key                  = "prod.terraform.tfstate"
    
  }

}

# Configure the Microsoft Azure Provider121212121212121212121212

data "azurerm_key_vault" "kv" {
  name                        = "testingtf"
  resource_group_name         = "cloud-shell-storage-centralindia"
  

}

data "azurerm_key_vault_secret" "kvs" {
  name         = "topsecret"
  key_vault_id = data.azurerm_key_vault.kv.id
}

output "secret_value" {
  value = data.azurerm_key_vault_secret.kvs.value
  sensitive = true
}
provider "azurerm" {
  skip_provider_registration = true
  features {}
  client_id       = "f0e7c9f2-e253-490d-81f4-3516f335840c"
  client_secret   = "al98Q~uprCOqjyhFrSYBZnQxG2egr4r3hmt0YbHT"
  tenant_id       = "25bf0fb2-a8e4-4a5c-a5ef-a1a27f1f2b8c"
  subscription_id = "3c445d9f-4d86-4e9d-95ab-f854109acd07"
}
