# admin only

# runas (https://qiita.com/sakekasunuts/items/63a4023887348722b416)
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) {
    Start-Process pwsh.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit
}

$files = @(
    ".vimrc"
    ".bashrc"
    ".inputrc"
    ".gitconfig.sync"
)

$here = Split-Path $PSCommandPath -Parent 

foreach ($file in $files) {
    New-Item -Path (Join-Path $home $file) -Value (Join-Path $here $file) -ItemType SymbolicLink
}

Add-Content (Join-Path $home ".gitconfig") @'
[include]
    path = ~/.gitconfig.sync
'@

read-host “Press ENTER to continue...”
