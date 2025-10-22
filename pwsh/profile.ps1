Clear-Host

oh-my-posh init pwsh --config ~/.config/ohmyposh/ohmyposh.omp.json | Invoke-Expression

# fastfetch --logo windows --logo-padding-top 1

# Set the console title to the currently running command
Set-PSReadLineKeyHandler -Key Enter `
    -BriefDescription RunWithTitle `
    -LongDescription "Set the console title to the command, then run the command" `
    -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    $Host.UI.RawUI.WindowTitle = $line
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function conit {
    # Conda initialization
    If (Test-Path "C:\Users\rairei\miniconda3\Scripts\conda.exe") {
        (& "C:\Users\rairei\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ? { $_ } | Invoke-Expression
        conda deactivate

        oh-my-posh init pwsh --config ~/.config/ohmyposh/ohmyposh.omp.json | Invoke-Expression
    }
}

function touch {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -ItemType File | Out-Null
    }

    Set-ItemProperty -Path $Path -Name LastAccessTime -Value (Get-Date)
}

function codef {
    $selected = fd -tf -u . $resolvedPath | fzf
    if ($selected) {
        code $selected
    }
}

function codec {
    $selected = fd -td -u . $resolvedPath | fzf
    if ($selected) {
        code $selected
    }
}

function cdc {
    $selected = fd -td -u | fzf
    if ($selected) {
        Set-Location $selected
    }
}

function cdnvim { Set-Location $env:LOCALAPPDATA\nvim }

function cdappdata { Set-Location $env:LOCALAPPDATA }

function cdprogramfiles { Set-Location $env:PROGRAMFILES }

function cdkm { Set-Location $env:LOCALAPPDATA\keymapper }

function ffetch { fastfetch --logo windows --logo-padding-top 1 }
