[cmdletbinding()]
param()
Write-Verbose $PSScriptRoot

# All exported functions - 600ms
foreach ($function in (Get-ChildItem "$PSScriptRoot\functions\*.ps1")) {
    $ExecutionContext.InvokeCommand.InvokeScript($false, ([scriptblock]::Create([io.file]::ReadAllText($function))), $null, $null)
}


# All internal functions privately available within the toolset - 221ms
foreach ($function in (Get-ChildItem "$PSScriptRoot\internal\*.ps1")) {
    $ExecutionContext.InvokeCommand.InvokeScript($false, ([scriptblock]::Create([io.file]::ReadAllText($function))), $null, $null)
}


Export-ModuleMember -function (Get-ChildItem -Path "$PSScriptRoot\functions\*.ps1").basename