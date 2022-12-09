resource "azurerm_app_service_plan" "main" {
  name                = "docker-asp"
  location            ="eastus"
  resource_group_name = "rg-demo-app"
  kind                = "Linux"
  reserved            = true
  
  sku {    
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main-service" {
  name                = "docker-app-service"
  location            = "eastus"
  resource_group_name = "rg-demo-app"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"
}