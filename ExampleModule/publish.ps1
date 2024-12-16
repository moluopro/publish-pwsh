# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/new-modulemanifest?view=powershell-7.4

# New-ModuleManifest
#    [-Path] <String>
#    [-NestedModules <Object[]>]
#    [-Guid <Guid>]
#    [-Author <String>]
#    [-CompanyName <String>]
#    [-Copyright <String>]
#    [-RootModule <String>]
#    [-ModuleVersion <Version>]
#    [-Description <String>]
#    [-ProcessorArchitecture <ProcessorArchitecture>]
#    [-PowerShellVersion <Version>]
#    [-CLRVersion <Version>]
#    [-DotNetFrameworkVersion <Version>]
#    [-PowerShellHostName <String>]
#    [-PowerShellHostVersion <Version>]
#    [-RequiredModules <Object[]>]
#    [-TypesToProcess <String[]>]
#    [-FormatsToProcess <String[]>]
#    [-ScriptsToProcess <String[]>]
#    [-RequiredAssemblies <String[]>]
#    [-FileList <String[]>]
#    [-ModuleList <Object[]>]
#    [-FunctionsToExport <String[]>]
#    [-AliasesToExport <String[]>]
#    [-VariablesToExport <String[]>]
#    [-CmdletsToExport <String[]>]
#    [-DscResourcesToExport <String[]>]
#    [-CompatiblePSEditions <String[]>]
#    [-PrivateData <Object>]
#    [-Tags <String[]>]
#    [-ProjectUri <Uri>]
#    [-LicenseUri <Uri>]
#    [-IconUri <Uri>]
#    [-ReleaseNotes <String>]
#    [-Prerelease <String>]
#    [-RequireLicenseAcceptance]
#    [-ExternalModuleDependencies <String[]>]
#    [-HelpInfoUri <String>]
#    [-PassThru]
#    [-DefaultCommandPrefix <String>]
#    [-WhatIf]
#    [-Confirm] 
#    [<CommonParameters>]

New-ModuleManifest -Path "./ExampleModule.psd1" `
    -RootModule "ExampleModule.psm1" `
    -ModuleVersion "0.1.1" `
    -Author "moluopro" `
    -Copyright "(c) 2024 [moluopro](https://github.com/moluopro). All rights reserved." `
    -Description "Some cmdlet in PowerShell" `
    -Tags @("xxx", "xxxxx") `
    -ProjectUri "https://github.com/moluopro/publish-pwsh" `
    -LicenseUri "https://www.apache.org/licenses/LICENSE-2.0.html" `
    -FunctionsToExport "*" `
    -AliasesToExport "*" `
    -VariablesToExport "*" `
    -CmdletsToExport "*" `
    -ReleaseNotes "Initial" `
    -PowerShellVersion "5.1" `
    -CompatiblePSEditions @("Core", "Desktop")
