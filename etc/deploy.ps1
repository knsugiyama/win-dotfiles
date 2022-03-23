Write-Host "#####"
Write-Host "symbolic link"
Write-Host "#####"

New-Item -Type SymbolicLink -Path $env:USERPROFILE\.gitconfig -Value $env:USERPROFILE\.dotfiles\.files\.gitconfig -Force

New-Item -Type SymbolicLink -Path $env:USERPROFILE\.wslconfig -Value $env:USERPROFILE\.dotfiles\.files\.wslconfig -Force

New-Item -Type SymbolicLink -Path $env:USERPROFILE\.tigrc -Value $env:USERPROFILE\.dotfiles\.files\.tigrc -Force

Write-Host "#####"
Write-Host "Profile.ps1"
Write-Host "#####"
$PS1PROFILE_DIR = "$env:USERPROFILE\Documents\PowerShell"
if (-not (Test-Path ("$PS1PROFILE_DIR"))) {
    mkdir $PS1PROFILE_DIR
}
New-Item -Type SymbolicLink -Path $PS1PROFILE_DIR\Profile.ps1 -Value $env:USERPROFILE\.dotfiles\Profile.ps1 -Force
# プロファイルを読み込み
. $PS1PROFILE_DIR\Profile.ps1

Write-Host "#####"
Write-Host "nvim"
Write-Host "#####"
$NVIM_DIR = "$env:USERPROFILE\AppData\Local\nvim"
if (Test-Path ("$NVIM_DIR")) {
    New-Item -Type SymbolicLink -Path $NVIM_DIR -Value $env:USERPROFILE\.dotfiles\.config\nvim -Force
}
