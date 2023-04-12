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
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEnFJzWAkKduj4O3xjm0PSux6yGC/amqgEWEjlpEbLf59R5VFAKnf7j3EhZFIiTCNBIx/3uBUVq5TPStqFhCeBaUEE1225E0oSb3OaljIv1UYD6+IAYH89S5DYRpuGJ/X3/bxtaSwDVD94KYN/GRiltMYthGsiBquW5/5Sl9wKEfUN04suMVSbQNvcXnSJ38sY/NUmytXKH8AZO+muXHNLX5nsnfNgpL0PKobNPNtd9jADhE3SYt9bCHc7A3qhhg1Ps4tblFfGjy0bY2Ev41F/cN7bkSSyKiXI1mI14X/UbwBrDE8Obp+saTLG1d5t/qS6NkOrNTrodZOx5wfevexmezT1BLdvTG1tRkOKNJx0EH3V1Fa83bUX6ahHAzhVqSyQOGgTrZDApXI+412HNtypchp6bmN/oeSvHfIWsIkyu6dbReTRPsMxNVUsjVjb/mJEyph1HujrKmIHfY7dgSztP9suhnXXQLrHPEE7Tqp9b7z5HEuGXlyRtQ4ycAJ5EHt1qCInsXY31+jojt9TRagNXTjOm/fY980fzZwvjCqf3M5vOdC8mgYrr10KDIkpUKdgf4zjEgTRK/iF7ajUS5pMScDUb1FMh1M9x2HhnAkYfmKUtU9DDcPUmXFJixzOAPQ50FkzybTMJBuv0GSdsU/tAqO2x7VMDEZe5UW75vM/8Q== stephane@montri.eu"
     }
  }

  tags = {
      environment = "demo"
      owner       = "smontri"
      label       = "Virtual Machine"
      project     = "MEWO"
  }
}