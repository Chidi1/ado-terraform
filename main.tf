# provider "azuredevops" {
#   source  = "microsoft/azuredevops"
#   version = ">= 0.0.1"
#   # Remember to specify the org service url and personal access token details below
#   org_service_url       = "https://agromart.visualstudio.com/"
#   personal_access_token = var.personal_access_token
# }
terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.0.1" # Specify the required version
    }
  }

  required_version = ">= 1.0.0" # Adjust based on your Terraform version
}

provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}

# export AZDO_PERSONAL_ACCESS_TOKEN="your-personal-access-token"


# data "azurerm_key_vault_secret" "pat" {
#   name         = "AzureDevOpsPAT"
#   key_vault_id = azurerm_key_vault.your_key_vault.id
# }

# provider "azuredevops" {
#   version              = ">= 0.0.1"
#   org_service_url      = "https://agromart.visualstudio.com/"
#   personal_access_token = data.azurerm_key_vault_secret.pat.value
# }


resource "azuredevops_project" "terraform_ado_project" {
  name               = var.project_name
  description        = var.description
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
  # Enable or desiable the DevOps fetures below (enabled / disabled)
  features = {
    "boards"       = "enabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "enabled"
    "artifacts"    = "enabled"
  }
}
