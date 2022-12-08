$resourceGoupName = 'webserverrsg'
$azureRegion = 'West Europe'
$vmName = 'webservervm'

New-AzResourceGroup -Name $resourceGoupName -Location $azureRegion

New-AzVm `
    -ResourceGroupName = $resourceGroupName `
    -Name = $vmName `
    -Location = $azureRegion `
    -Image = UbuntuTLS `
    -size = Standard_B2s `
    -PublicIpAddressName = myPubIP `
    -OpenPorts 80 `
    -GenerateSshKey `
    -SshKeyName = mySSHKey
    
Invoke-AzVMRunCommand `
   -ResourceGroupName = $resourceGroupName `
   -Name = $vmName `
   -CommandId 'RunShellScript' `
   -ScriptString 'sudo apt-get update && sudo apt-get install -y nginx'
