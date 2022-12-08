resource "azurerm_app_service_plan" "main" {
  name                = "docker-asp"
  location            = data.azurerm_resource_group.demo-app-rg.location
  resource_group_name = data.azurerm_resource_group.demo-app-rg.name
  kind                = "Linux"
  reserved            = true
  
  sku {    
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main-service" {
  name                = "docker-app-service"
  location            = data.azurerm_resource_group.demo-app-rg.location
  resource_group_name = data.azurerm_resource_group.demo-app-rg.name
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"
}