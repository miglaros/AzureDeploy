﻿### Setup of A2A Coordinater

param (
        $AzureSubAdmin="automation@kristianneseoutlook.onmicrosoft.com",
        $AzureAdminPwd="abab12UNI",
        $OMSResourceGroupName,
        $OMSRecoveryVaultName      
      )

# Install AzureRM modules for A2A scenario

Find-module -Name AzureRm.SiteRecovery | Install-Module -Force

Find-Module -Name AzureRm.RecoveryServices | Install-Module -Force

find-module -Name AzureRm.RecoveryServices.Backup | Install-Module -Force

# Login to Azure and download the vault credentials
$AzureAdminPwd = ConvertTo-SecureString $AzureAdminPwd -AsPlainText -Force
$Admincreds = New-Object System.Management.Automation.PSCredential (“$AzureSubAdmin”, $AzureAdminPwd)

Login-AzureRmAccount -Credential $Admincreds

$vault = Get-AzureRmRecoveryServicesVault -ResourceGroupName $OMSResourceGroupName -Name $OMSRecoveryVaultName

Get-AzureRmRecoveryServicesVaultSettingsFile -Vault $vault -Path c:\a2a\

# That's it!

