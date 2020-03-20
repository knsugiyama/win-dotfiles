Write-Host "#####"
Write-Host "フォントの設定"
Write-Host "#####"

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
