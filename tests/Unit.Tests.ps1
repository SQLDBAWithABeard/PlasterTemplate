$projectRoot = Resolve-Path "$PSScriptRoot\.."
$script:ModuleName = '<%= $PLASTER_PARAM_ModuleName %>'
# Removes all versions of the module from the session before importing
Get-Module $ModuleName | Remove-Module
Import-Module $ModuleBase\$ModuleName.psd1 -PassThru -ErrorAction Stop
Describe "Basic function unit tests" -Tags Build {

}