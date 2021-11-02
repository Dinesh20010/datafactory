#Create the Resource group
resource "azurerm_resource_group" "az_rg" {
  name     = "${var.prefix}-${var.suffix}"
  location = var.az_region
  tags     = var.az_tags
}

#Create Azure Data Factory (w/GIT)
resource "azurerm_data_factory" "datafactorygit" {
  count               = var.datafactory == "true" && var.datafactory_git == "true" ? 1 : 0
  name                = "${var.prefix}-factorygit-${var.suffix}"
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = var.az_region
  tags                = var.az_tags
  github_configuration {
    account_name    = var.git_account
    branch_name     = var.git_branch
    git_url         = var.git_hostname
    repository_name = var.git_repo
    root_folder     = var.git_folder
  }
}

#Create Azure Data Factory
resource "azurerm_data_factory" "datafactory" {
  count               = var.datafactory == "true" && var.datafactory_git == "false" ? 1 : 0
  name                = "${var.prefix}-factory-${var.suffix}"
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = var.az_region
  tags                = var.az_tags
}

# Create the Data Factory Integrattion Runtime Managed
resource "azurerm_data_factory_integration_runtime_managed" "irm" {
  name                = "${var.prefix}-Integration-${var.suffix}"
  data_factory_name   = azurerm_data_factory.datafactory.name
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = var.az_region
  node_size = "Standard_D8_v3"
}

# Create the Data Factory Self hosted Integrattion Runtime
resource "azurerm_data_factory_integration_runtime_self_hosted" "adf_ir" {
  count               = var.adf_ir_name == "" ? 0 : 1
  name                = var.adf_ir_name
  resource_group_name = var.adf_config.resource_group_name
  data_factory_name   = azurerm_data_factory.adf.name
}