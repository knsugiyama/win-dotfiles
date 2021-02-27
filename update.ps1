Write-Host "#####"
Write-Host "update"
Write-Host "#####"

$CURRENTPATH = Get-Location
$DOTFILES = "$env:USERPROFILE\.dotfiles"

Set-Location $DOTFILES

if (Test-Path ("$DOTFILES\.git")) {
    git checkout master
    git pull
}
else {
    git init
    git remote add origin https://github.com/knsugiyama/wsl-dotfiles.git
    git fetch origin
    git checkout --force origin/master
}

Set-Location $CURRENTPATH

scoop update *
scoop cleanup *
