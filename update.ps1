Write-Host "#####"
Write-Host "update"
Write-Host "#####"

$GITFILE = "$env:USERPROFILE\.dotfiles\.git"

if (Test-Path ("$GITFILE")) {
    git checkout master
    git pull
}
else {
    git init
    git remote add origin https://github.com/knsugiyama/wsl-dotfiles.git
    git fetch origin
    git checkout --force origin/master
}

scoop update *
