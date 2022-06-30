# gpeditから、ユーザーにシンボリック作成権限を付与する必要あり
# Computer configuration → Windows Settings → Security Settings → Local Policies → User Rights Assignment → Create symbolic links
Write-Host "#####"
Write-Host "symbolic link"
Write-Host "#####"

New-Item -Type SymbolicLink -Path $env:USERPROFILE\.gitconfig -Value $env:USERPROFILE\.dotfiles\.gitconfig -Force
New-Item -Type SymbolicLink -Path $env:USERPROFILE\.mytheme.omp.json -Value $env:USERPROFILE\.dotfiles\.mytheme.omp.json -Force
New-Item -Type SymbolicLink -Path $env:USERPROFILE\.tigrc -Value $env:USERPROFILE\.dotfiles\.tigrc -Force
New-Item -Type SymbolicLink -Path $env:USERPROFILE\.vimrc -Value $env:USERPROFILE\.dotfiles\.vimrc -Force
New-Item -Type SymbolicLink -Path $env:USERPROFILE\.wslconfig -Value $env:USERPROFILE\.dotfiles\.wslconfig -Force

Write-Host "#####"
Write-Host "Profile.ps1"
Write-Host "#####"
$PS1PROFILE_DIR = "$env:USERPROFILE\Documents\PowerShell"
if (-not (Test-Path ("$PS1PROFILE_DIR"))) {
    mkdir $PS1PROFILE_DIR
}
New-Item -Type SymbolicLink -Path $PS1PROFILE_DIR\Profile.ps1 -Value $env:USERPROFILE\.dotfiles\Profile.ps1 -Force
