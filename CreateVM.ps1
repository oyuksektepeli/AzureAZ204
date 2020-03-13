#Connect Azure with Powershell
Install-Module -Name Az -AllowClobber -Scope CurrentUser

#Connect and Authenticate
Connect-AzAccount

#Get Current Connected Subscription/Context
Get-AzContext

#Get All Azure Subscriptions
Get-AzSubscription | more

#Select Azure Subscription
Select-AzContext

$rg = Get-AzResourceGroup `
  -Name 'nc-demo-rg' `
  -Location 'westeurope'

$rg

$subnetConfig = New-AzVirtualNetworkSubnetConfig `
    -Name 'nc-demo-subnet-2' `
    -AddressPrefix '10.33.2.0/24'

$subnetConfig

$vnet = New-AzVirtualNetwork `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -Name 'nc-demo-vnet-2' `
    -AddressPrefix '10.33.0.0/16' `
    -Subnet $subnetConfig

$vnet

$pip = New-AzPublicIpAddress `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -Name 'nc-demo-linux-2-pip-1' `
    -AllocationMethod Static

$pip

$rule1 = New-AzNetworkSecurityRuleConfig `
    -Name ssh-rule `
    -Description 'Allow SSH' `
    -Access Allow `
    -Protocol Tcp `
    -Direction Inbound `
    -Priority 100 `
    -SourceAddressPrefix Internet `
    -SourcePortRange * `
    -DestinationAddressPrefix * `
    -DestinationPortRange 22

$rule1

$nsg = New-AzNetworkSecurityGroup `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -Name 'nc-demo-linux-nsg-2' `
    -SecurityRules $rule1

$nsg | more

$subnet = $vnet.Subnets | Where-Object { $_.Name -eq 'nc-demo-vnet-2' }

$nic = New-AzNetworkInterface `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -Name 'nc-demo-linux-2-nic-1' `
    -Subnet $subnet `
    -PublicIpAddress $pip `
    -NetworkSecurityGroup $nsg

$nic

$LinuxVmConfig = New-AzureRmVMConfig `
    -VMName 'nc-demo-ubuntu-2' `
    -VMSize 'Standard_D1'

$password = ConvertTo-SecureString 'password12345&&%%++' -AsPlainText -Force
$linuxvmcred = New-Object System.Management.Automation.PSCredential ('ncvmadmin', $password)

$LinuxVmConfig = Set-AzVMOperatingSystem `
    -VM $LinuxVmConfig `
    -Linux `
    -ComputerName 'nc-demo-ubuntu-2' `
    -DisablePasswordAuthentication `
    -Credential $linuxvmcred

$sshPublicKey = Get-Content "~/.ssh/id_rsa.pub"
Add-AzVMSshPublicKey `
        -VM $LinuxVmConfig `
        -KeyData $sshPublicKey `
        -Path "/home/ncvmadmin/.ssh/authorized_keys"

Get-AzVMImageSku -Location $rg.Location -PublisherName "Canonical" -Offer "Ubuntu"

$LinuxVmConfig = Set-AzVMSourceImage `
    -VM $LinuxVmConfig `
    -PublisherName 'Canonical' `
    -Offer 'UbuntuServer' `
    -Skus '18.04-LTS' `
    -Version 'latest'

$LinuxVmConfig = Add-AzRmVMNetworkInterface `
    -VM $LinuxVmConfig `
    -Id $nic.Id 

New-AzVM `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -VM $LinuxVmConfig

$MyIP = Get-AzPublicIpAddress `
    -ResourceGroupName $rg.ResourceGroupName `
    -Name $pip.Name | Select-Object -ExpandProperty IpAddress

$MyIP   

ssh -l ncvmadmin $MyIP