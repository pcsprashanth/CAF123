locals {
  windows_image_ids = {
    "jstartwinvm001" = {
      source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
      source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
      source_image_reference_sku           = "2016-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
      source_image_reference_version       = "latest"         
 
  
  
  
    }
  }
}  
