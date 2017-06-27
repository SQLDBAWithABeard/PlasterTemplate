<#
$manifestProperties = @{
    Path            = "GIT:\PlasterTemplate\PlasterManifest.xml"
    Title           = "Full Module Template"
    TemplateName    = 'FullModuleTemplate'
    TemplateVersion = '0.0.1'
    Author          = 'Rob Sewell'
}

New-Item -Path FullModuleTemplate -ItemType Directory
New-PlasterManifest @manifestProperties 
#>


$plaster = @{
    TemplatePath    = "GIT:\PlasterTemplate" #(Split-Path $manifestProperties.Path)
    DestinationPath = "GIT:\module"
    FullName = "Rob Sewell"
    ModuleName = "NewModule"
    ModuleDesc = "Here is a module description"
    Version = "0.9.0"
    GitHubUserName = "SQLDBAWithABeard"
    GitHubRepo = "NewModule"
}

If (!(Test-Path $plaster.DestinationPath)) {
    New-Item -ItemType Directory -Path $plaster.DestinationPath
}
Invoke-Plaster @plaster -Verbose

<#
Remove-item $plaster.DestinationPath -Recurse -Force 
#>