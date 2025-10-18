clear-host

oh-my-posh init pwsh --eval --config ~/.config/ohmyposh/ohmyposh.omp.json | Invoke-Expression

fastfetch --logo windows --logo-padding-top 1

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
        (& "C:\Users\rairei\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
        conda deactivate
  	oh-my-posh init pwsh --config ~/.config/ohmyposh/ohmyposh.omp.json | Invoke-Expression
    }
}

function cdnvim {
	set-location $env:LOCALAPPDATA\nvim
  }

function cdome {
	set-location ~
  }

function cdonfig {
	set-location ~\.config
}

function cdappdata {
	set-location $env:LOCALAPPDATA
}

function cdprogramfiles {
	set-location $env:PROGRAMFILES
}

function cdprj {
	set-location ~\projects
}

function cdkm {
	set-location $env:LOCALAPPDATA\keymapper
}

