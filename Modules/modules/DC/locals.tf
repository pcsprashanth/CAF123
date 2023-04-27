locals {
  # Local variables for DC1
  dc1_fqdn = "${var.ad_dc1_name}.${var.ad_domain_name}"
  dc1_disk = "osdisk1-xxxx-pwdc-xxxx01"

  installstor        = "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force -Scope CurrentUser"
  installstor1       = "Install-PackageProvider NuGet -Force"
  installstor2       = "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted"
  Importblob         = "Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force"
  user               = "$username = '${data.azurerm_key_vault_secret.appid.value}'"
  password           = "$password = '${data.azurerm_key_vault_secret.secret.value}'"
  password1          = "$password =  ConvertTo-SecureString $password -AsPlainText -Force"
  credforazconnect   = "$pscredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password"
  connecttoaz        = "Connect-AzAccount -ServicePrincipal -Credential $pscredential -Tenant ${data.azurerm_subscription.current.tenant_id}"
  azcontext          = "Set-AzContext -Subscriptionid ${data.azurerm_subscription.current.subscription_id}"
  storage            = "$key = Get-AzStorageAccountKey -Name ${azurerm_storage_account.this.name} -ResourceGroupName ${azurerm_storage_account.this.resource_group_name} | Where-Object {$_.KeyName -eq 'key1'}"
  context            = "$ctx = New-AzStorageContext -StorageAccountName ${azurerm_storage_account.this.name} -StorageAccountKey $key.Value"
  dc1_fetchblob      = "$blob = Get-AzStorageBlob -Container ${azurerm_storage_container.this.name} -Context $ctx"
  createddir = "New-Item -Path 'C:/DCFolder' -ItemType Directory -ErrorAction SilentlyContinue"
  dc1_storage_fetch  = "Get-AzStorageBlobContent -Container ${azurerm_storage_container.this.name} -Blob 'Manage-AdObjects-22H1.zip' -Destination 'C:/DCFolder' -Context $ctx -Force"
  dc1_extract_files = "Expand-Archive 'C:/DCFolder/Manage-AdObjects-22H1.zip' -DestinationPath 'C:/DCFolder'"
  dc1_switch_dir = "cd 'C:/DCFolder/Manage-AdObjects-22H1'"
  dc1_run_gpo_script = "./Manage-AdObjects.ps1 -Restore -SettingsXml ./settings-tm-full.xml -GPO All -GpoLinks Linkenabled -WmiFilter -Permissions -Admx -Confirm:$false -Force"

  dc1_prereq_ad_1 = "Import-Module ServerManager"
  dc1_prereq_ad_2 = "Install-WindowsFeature AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools"
  dc1_prereq_ad_3 = "Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools"
  dc1_prereq_ad_4 = "Import-Module ADDSDeployment"
  dc1_prereq_ad_5 = "Import-Module DnsServer"

  dc1_install_ad_1 = "Install-ADDSForest -DomainName ${var.ad_domain_name} -DomainNetbiosName ${var.ad_domain_netbios_name} -DomainMode ${var.ad_domain_mode} -ForestMode ${var.ad_domain_mode} "
  dc1_install_ad_2 = "-DatabasePath ${local.dc1_disk} -SysvolPath ${local.dc1_disk} -LogPath ${local.dc1_disk} -NoRebootOnCompletion:$false -Force:$true "
  dc1_install_ad_3 = "-SafeModeAdministratorPassword (ConvertTo-SecureString -String ${random_password.ad_safe_mode_administrator_password.result} -AsPlainText -Force)"

  dc1_shutdown_command = "shutdown -r -t 10"
  dc1_exit_code_hack   = "exit 0"

  dc1_download_gpo_files = "${local.installstor};${local.installstor1};${local.installstor2};${local.Importblob}; ${local.user}; ${local.password}; ${local.password1}; ${local.credforazconnect};${local.connecttoaz}; ${local.azcontext}; ${local.storage};${local.context};${local.dc1_fetchblob};${local.createddir};${local.dc1_storage_fetch};${local.dc1_extract_files};${local.dc1_switch_dir};${local.dc1_run_gpo_script}"
  dc1_powershell_command = "${local.dc1_prereq_ad_1};${local.dc1_prereq_ad_2};${local.dc1_prereq_ad_3};${local.dc1_prereq_ad_4};${local.dc1_prereq_ad_5};${local.dc1_install_ad_1}${local.dc1_install_ad_2}${local.dc1_install_ad_3};${local.dc1_shutdown_command};${local.dc1_exit_code_hack}"

  # Local variables for DC2
  dc2_fqdn = "${var.ad_dc2_name}.${var.ad_domain_name}"
  dc2_disk = "osdisk1-xxxx-pwdc-xxxx02"

  dc2_prereq_ad_1 = "Import-Module ServerManager"
  dc2_prereq_ad_2 = "Install-WindowsFeature AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools"
  dc2_prereq_ad_3 = "Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools"
  dc2_prereq_ad_4 = "Import-Module ADDSDeployment"
  dc2_prereq_ad_5 = "Import-Module DnsServer"

  dc2_credentials_1 = "$User = '${var.ad_username}'"
  #dc2_credentials_2 = "$PWord = ${data.azurerm_key_vault_secret.dc1.value}"
  dc2_password      = "$PWord = '${data.azurerm_key_vault_secret.dc1.value}'"
  dc2_credentials_2 = "$PWord = ConvertTo-SecureString $PWord -AsPlainText -Force"
  dc2_credentials_3 = "$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord"

  #dc2_domain_join_command = "Add-Computer -ComputerName ${var.ad_dc2_name} -LocalCredential ${var.ad_dc2_name}+'\\'+${var.ad_domain_netbios_name} -DomainName ${var.ad_domain_name} -Credential ${var.ad_admin_username}@${var.ad_domain_name} -Restart -'\\'Force"

  dc2_install_ad_1 = "Install-ADDSDomainController -DomainName ${var.ad_domain_name} -InstallDns -Credential $Credential  -SafeModeAdministratorPassword (ConvertTo-SecureString -String ${random_password.ad_safe_mode_administrator_password.result} -AsPlainText -Force) -Force:$true"
  #dc2_install_ad_2 = "-DatabasePath ${local.dc2_disk} -SysvolPath ${local.dc2_disk} -LogPath ${local.dc2_disk} -NoRebootOnCompletion:$false -Force:$true "
  #dc2_install_ad_3 = "-SafeModeAdministratorPassword (ConvertTo-SecureString -String ${random_password.ad_safe_mode_administrator_password.result} -AsPlainText -Force) -CriticalReplicationOnly"

  dc2_shutdown_command = "shutdown -r -t 10"
  dc2_exit_code_hack   = "exit 0"

  #dc2_powershell_command = "${local.dc2_prereq_ad_1}; ${local.dc2_prereq_ad_2}; ${local.dc2_prereq_ad_3}; ${local.dc2_prereq_ad_4}; ${local.dc2_prereq_ad_5}; ${local.dc2_credentials_1}; ${local.dc2_credentials_2}; ${local.dc2_credentials_3}; ${local.dc2_domain_join_command}; ${local.dc2_install_ad_1}${local.dc2_install_ad_2}${local.dc2_install_ad_3}; ${local.dc2_shutdown_command}; ${local.dc2_exit_code_hack}"
  dc2_powershell_command = "${local.dc2_prereq_ad_1}; ${local.dc2_prereq_ad_2}; ${local.dc2_prereq_ad_3}; ${local.dc2_prereq_ad_4}; ${local.dc2_prereq_ad_5}; ${local.dc2_credentials_1}; ${local.dc2_password}; ${local.dc2_credentials_2}; ${local.dc2_credentials_3}; ${local.dc2_install_ad_1}; ${local.dc2_shutdown_command}; ${local.dc2_exit_code_hack}"
}
