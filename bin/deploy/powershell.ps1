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
