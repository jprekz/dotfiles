# admin only

$files = @(
    ".vimrc"
    ".bashrc"
    ".inputrc"
    ".gitconfig"
)

$here = Split-Path $PSCommandPath -Parent 

foreach ($file in $files) {
    New-Item -Path (Join-Path $home $file) -Value (Join-Path $here $file) -ItemType SymbolicLink
}
