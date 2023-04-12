# Network Security Group and rule
resource "azurerm_network_security_group" "mewo-nsg" {
    name                = "smontri-nsg"
    location            = azurerm_resource_group.mewo-rg.location
    resource_group_name = azurerm_resource_group.mewo-rg.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    tags = {
        environment = "demo"
        owner       = "smontri"
        label       = "Network Security Group"
        project     = "MEWO"
    }
}

# Network Interface
resource "azurerm_network_interface" "mewo-nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.mewo-rg.location
  resource_group_name = azurerm_resource_group.mewo-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.mewo-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mewo-ip.id
  }

  tags = {
    environment = "demo"
    owner       = "smontri"
    label       = "Network Interface"
    project     = "MEWO"
  }
}

# Associate Network Security group with Subnet
resource "azurerm_subnet_network_security_group_association" "nsg-subnet" {
  subnet_id                 = azurerm_subnet.mewo-subnet.id
  network_security_group_id = azurerm_network_security_group.mewo-nsg.id
}