$hkVer = "v2.2.3"
$hk = "HackGenNerd" + $hkVer
# ダウンロードするファイルのURL
$target_url = "https://github.com/yuru7/HackGen/releases/download/$hkVer/$hk.zip"
# ローカルの保存先
$file_path = Convert-Path .
$file_path = $file_path + "\" + $hk + ".zip"

# ファイルのダウンロード(インストールは今のところ手動)
$web_client = New-Object System.Net.WebClient
$web_client.DownloadFile($target_url, $file_path)

Expand-Archive ./$hk.zip
Remove-Item -Path ./$hk.zip -Recurse -Force
