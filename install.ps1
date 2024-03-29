Write-Host "#####"
Write-Host "Set-ExecutionPolicy を RemoteSigned に変更"
Write-Host "#####"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Write-Host "#####"
Write-Host "wingetをインストール"
Write-Host "#####"

Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile winget.msixbundle -UseBasicParsing
Add-AppxPackage -Path winget.msixbundle
Remove-Item winget.msixbundle

winget install -e -id Git.Git

Write-Host "#####"
Write-Host "scoopのインストールチェック"
Write-Host "#####"

$scoopdir = $HOME + "\scoop"
if (Test-Path $scoopdir) {
    Write-Host "すでにインストールされています。"
}
else {
    Write-Host "scoop をインストールします。"
    Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
    set-executionpolicy unrestricted -s cu
    Write-Host "インストールが完了しました。"
}

Write-Host "#####"
Write-Host "git clone"
Write-Host "#####"

git clone https://github.com/knsugiyama/win-dotfiles.git $env:USERPROFILE\.dotfiles

Write-Host "#####"
Write-Host "profile.ps1を追加"
Write-Host "#####"

$PS1PROFILE_DIR = "$env:USERPROFILE\Documents\PowerShell"

if (Test-Path ("$PS1PROFILE_DIR")) {
    Remove-Item $PS1PROFILE_DIR\Profile.ps1 -Recurse -Force
}
else {
    mkdir $PS1PROFILE_DIR
}

New-Item -Type SymbolicLink -Path $PS1PROFILE_DIR\Profile.ps1 -Value $env:USERPROFILE\.dotfiles\.files\Profile.ps1
# プロファイルを読み込み
. $env:USERPROFILE\.dotfiles\.files\Profile.ps1

Write-Host "#####"
Write-Host "後始末"
Write-Host "#####"

Remove-Item $env:USERPROFILE\download.ps1 -Recurse -Force
