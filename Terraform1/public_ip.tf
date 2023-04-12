# Public IPs
resource "azurerm_public_ip" "mewo-ip" {
    name                         = "smontri-ip"
    location                     = azurerm_resource_group.mewo-rg.location
    resource_group_name          = azurerm_resource_group.mewo-rg.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "demo"
        owner       = "smontri"
        label       = "Public IP"
        project     = "MEWO"
    }
}
