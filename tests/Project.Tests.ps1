$script:ModuleName = '<%= $PLASTER_PARAM_ModuleName %>'
# Removes all versions of the module from the session before importing
Get-Module $ModuleName | Remove-Module
Import-Module $PSScriptRoot\$ModuleName\$ModuleName.psd1 -PassThru -ErrorAction Stop | Out-Null
# Removes all versions of the module from the session before importing
Get-Module $ModuleName | Remove-Module
Import-Module $ModuleBase\$ModuleName.psd1 -PassThru -ErrorAction Stop
Describe "PSScriptAnalyzer rule-sets" -Tag Build {

    $Rules = Get-ScriptAnalyzerRule
    $scripts = Get-ChildItem $moduleRoot -Include *.ps1, *.psm1, *.psd1 -Recurse | where fullname -notmatch 'classes'

    foreach ( $Script in $scripts ) 
    {
        Context "Script '$($script.FullName)'" {

            foreach ( $rule in $rules )
            {
                It "Rule [$rule]" {

                    (Invoke-ScriptAnalyzer -Path $script.FullName -IncludeRule $rule.RuleName ).Count | Should Be 0
                }
            }
        }
    }
}


Describe "General project validation: $moduleName" -Tags Build {

    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
    }
}