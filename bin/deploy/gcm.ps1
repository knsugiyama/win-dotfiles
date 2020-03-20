Write-Host "############"
Write-Host "install gcm"
Write-Host "############"

# $gcmVer = "1.20.0"
# $gcmExe = "GCMW-$gcmVer.exe"
# # ダウンロードするファイルのURL
# $target_url = "https://github.com/microsoft/Git-Credential-Manager-for-Windows/releases/download/$gcmVer/$gcmExe"
# # ローカルの保存先
# $file_path = Convert-Path .
# $file_path = $file_path + "\" + $gcmExe

# # ファイルのダウンロード
# $web_client = New-Object System.Net.WebClient
# $web_client.DownloadFile($target_url, $file_path)

# Start-Process -FilePath $gcmExe -Wait

# Remove-Item -Path ./$gcmExe -Recurse -Force

git config --global credential.helper manager
