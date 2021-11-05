
#Create Azure Data Factory (w/GIT)
resource "azurerm_data_factory" "datafactorygit" {
  name                = "${var.prefix}-factorygit-${var.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.az_region
  github_configuration {
    account_name    = var.git_account
    branch_name     = var.git_branch
    git_url         = var.git_hostname
    repository_name = var.git_repo
    root_folder     = var.git_folder
  }
}


# Create the Data Factory Integrattion Runtime Managed
resource "azurerm_data_factory_integration_runtime_managed" "irm" {
  name                = "${var.prefix}-Integration-${var.suffix}"
  data_factory_name   = azurerm_data_factory.datafactorygit.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.az_region
  node_size = "Standard_D8_v3"
}

# Create the Data Factory Self hosted Integrattion Runtime
resource "azurerm_data_factory_integration_runtime_self_hosted" "adf_ir" {
  name                = var.adf_ir_name
  resource_group_name = azurerm_resource_group.rg.name
  data_factory_name   = azurerm_data_factory.datafactorygit.name
}