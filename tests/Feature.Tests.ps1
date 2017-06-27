$script:ModuleName = '<%= $PLASTER_PARAM_ModuleName %>'
# Removes all versions of the module from the session before importing
Get-Module $ModuleName | Remove-Module
Import-Module $PSScriptRoot\$ModuleName\$ModuleName.psd1 -PassThru -ErrorAction Stop | Out-Null
Describe "Basic function feature tests" -Tags Build {

}