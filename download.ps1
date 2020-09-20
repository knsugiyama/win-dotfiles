Write-Host "#####"
Write-Host "Set-ExecutionPolicy を RemoteSigned に変更"
Write-Host "#####"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Write-Host "#####"
Write-Host "chocolateyをインストールして、gitをインストール"
Write-Host "#####"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install git

Write-Host "#####"
Write-Host "scoopのインストールチェック"
Write-Host "#####"

$scoopdir = $HOME + "\scoop"
if (Test-Path $scoopdir) {
    Write-Host "すでにインストールされています。"
}
else {
    Write-Host "インストールします。"
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
sudo New-Item -Type SymbolicLink -Path $PS1PROFILE_DIR\Profile.ps1 -Value $env:USERPROFILE\.dotfiles\.files\Profile.ps1
# プロファイルを読み込み
. $env:USERPROFILE\.dotfiles\.files\Profile.ps1

Write-Host "#####"
Write-Host "後始末"
Write-Host "#####"
Remove-Item $env:USERPROFILE\download.ps1 -Recurse -Force
