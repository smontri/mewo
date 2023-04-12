# Virtual Machine
resource "azurerm_virtual_machine" "mewo-vm" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.mewo-rg.location
  resource_group_name   = azurerm_resource_group.mewo-rg.name
  network_interface_ids = [azurerm_network_interface.mewo-nic.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "mewo-vm01"
    admin_username = "mewo-user"
   # admin_password = "Password1234!"
  }

  os_profile_linux_config {
   # disable_password_authentication = false
     disable_password_authentication = true
     ssh_keys {
      path     = "/home/mewo-user/.ssh/authorized_keys"
      # votre clé SSH publique
      key_data = "XXX"
     }
  }

  tags = {
      environment = "demo"
      owner       = "smontri"
      label       = "Virtual Machine"
      project     = "MEWO"
  }
}