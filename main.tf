provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "datafactoryterraform"
  location = "West Europe"
}

module "dinesh_azure_df" {
  source              = "dinesh_azure_df"
  resource_group_name = azurerm_resource_group.rg.name
  prefix              = "az"
  suffix              = "df"
  datafactory         = "true"
  datafactory_git     = "true"
  adf_ir_name         = ""
  az_region           = "West Europe"
  git_account         = "Dinesh20010"
  git_branch          = "main"
  git_folder          = "/"
  git_hostname        = "https://github.com"
  git_repo            = "datafactory"
}
 