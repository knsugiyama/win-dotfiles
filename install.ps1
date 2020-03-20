Write-Host "############"
Write-Host "Set-ExecutionPolicy を RemoteSigned に変更"
Write-Host "############"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned


Write-Host "############"
Write-Host "不要なデフォルトアプリの削除"
Write-Host "############"

Get-AppxPackage king.com.CandyCrushFriends | Remove-AppxPackage              # Candy Crush Friends
Get-AppxPackage king.com.FarmHeroesSaga | Remove-AppxPackage                 # Farm Heroes Saga
Get-AppxPackage SpotifyAB.SpotifyMusic | Remove-AppxPackage                  # Spotify(1709以降)


Write-Host "############"
Write-Host "scoopのインストールチェック"
Write-Host "############"

$scoopdir = $HOME + "\scoop"
if (Test-Path $scoopdir) {
  Write-Host "すでにインストールされています。"
}
else {
  Write-Host "インストールします。"
  iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
  set-executionpolicy unrestricted -s cu
  Write-Host "インストールが完了しました。"
}


Write-Host "############"
Write-Host "scoopによるアプリインストールを実施"
Write-Host "############"
# とにもかくにも、gitが必要
scoop install git

scoop bucket add extras
scoop bucket add versions

scoop install 7zip
scoop install autohotkey
scoop install brave
scoop install curl
scoop install ghq
scoop install libreoffice-stable
scoop install peco
scoop install postman
scoop install powertoys
scoop install screentogif
scoop install sudo
scoop install vcxsrv
scoop install vscode
scoop install wget


Write-Host "############"
Write-Host "powershell coreを導入"
Write-Host "############"

$powshellVer = "7.0.0"
$powshell = "PowerShell-$powshellVer-win-x64.msi"
# ダウンロードするファイルのURL
$target_url = "https://github.com/PowerShell/PowerShell/releases/download/v$powshellVer/$powshell"
# ローカルの保存先
$file_path = Convert-Path .
$file_path = $file_path + "\" + $powshell

# ファイルのダウンロード
$web_client = New-Object System.Net.WebClient
$web_client.DownloadFile($target_url, $file_path)

Add-AppxPackage ./$powshell
Remove-Item -Path ./$powshell -Recurse -Force


Write-Host "############"
Write-Host "フォントの設定"
Write-Host "############"

$cicaVer = "v5.0.1"
$cica = "Cica_" + $cicaVer + "_with_emoji"
# ダウンロードするファイルのURL
$target_url = "https://github.com/miiton/Cica/releases/download/$cicaVer/$cica.zip"
# ローカルの保存先
$file_path = Convert-Path .
$file_path = $file_path + "\" + $cica + ".zip"

# ファイルのダウンロード(インストールは今のところ手動)
$web_client = New-Object System.Net.WebClient
$web_client.DownloadFile($target_url, $file_path)

Expand-Archive ./$cica.zip
Remove-Item -Path ./$cica.zip -Recurse -Force


Write-Host "############"
Write-Host "dotfileのシンボリックリンクを作成"
Write-Host "############"

Remove-Item "$HOME\.gitconfig"
sudo New-Item -Type SymbolicLink -Path "$HOME\.gitconfig" -Value "$HOME\win-dotfiles\.gitconfig"
Remove-Item "$HOME\.wslconfig"
sudo New-Item -Type SymbolicLink -Path "$HOME\.wslconfig" -Value "$HOME\win-dotfiles\.wslconfig"

Write-Host "セットアップが終了しました。キーを押すと終了します。"
$host.UI.ReadLine()
