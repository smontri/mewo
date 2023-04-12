# Resource Group
resource "azurerm_resource_group" "mewo-rg" {
  name     = "${var.prefix}-resources"
  location = "North Europe"

  tags = {
      environment = "demo"
      owner       = "smontri"
      label       = "Resource Group"
      project     = "MEWO"
  }
}