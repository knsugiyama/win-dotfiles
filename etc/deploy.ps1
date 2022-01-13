Write-Host "#####"
Write-Host "シンボリックリンクを作成"
Write-Host "#####"

Remove-Item "$HOME\.gitconfig"
sudo New-Item -Type SymbolicLink -Path $env:USERPROFILE\.gitconfig -Value $env:USERPROFILE\.dotfiles\.files\.gitconfig
Remove-Item "$HOME\.wslconfig"
sudo New-Item -Type SymbolicLink -Path $env:USERPROFILE\.wslconfig -Value $env:USERPROFILE\.dotfiles\.files\.wslconfig
Remove-Item "$HOME\.tigrc"
sudo New-Item -Type SymbolicLink -Path $env:USERPROFILE\.tigrc -Value $env:USERPROFILE\.dotfiles\.files\.tigrc

Write-Host "#####"
Write-Host "Profile.ps1"
Write-Host "#####"
$PS1PROFILE_DIR = "$env:USERPROFILE\Documents\PowerShell"
if (Test-Path ("$PS1PROFILE_DIR")) {
    Remove-Item $PS1PROFILE_DIR\Profile.ps1 -Recurse -Force
}
else {
    mkdir $PS1PROFILE_DIR
}
sudo New-Item -Type SymbolicLink -Path $PS1PROFILE_DIR\Profile.ps1 -Value $env:USERPROFILE\.dotfiles\Profile.ps1
# プロファイルを読み込み
. $PS1PROFILE_DIR\Profile.ps1

Write-Host "#####"
Write-Host "nvim"
Write-Host "#####"
$NVIM_DIR = "$env:USERPROFILE\AppData\Local\nvim"
if (Test-Path ("$NVIM_DIR")) {
    Remove-Item $NVIM_DIR -Recurse -Force
}
sudo New-Item -Type SymbolicLink -Path $NVIM_DIR -Value $env:USERPROFILE\.dotfiles\.config\nvim
