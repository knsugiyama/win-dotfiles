Write-Host "#####"
Write-Host "不要なデフォルトアプリの削除"
Write-Host "#####"

Get-AppxPackage king.com.CandyCrushFriends | Remove-AppxPackage              # Candy Crush Friends
Get-AppxPackage king.com.FarmHeroesSaga | Remove-AppxPackage                 # Farm Heroes Saga
Get-AppxPackage SpotifyAB.SpotifyMusic | Remove-AppxPackage                  # Spotify(1709以降)


Write-Host "############"
Write-Host "scoopによるアプリインストールを実施"
Write-Host "############"

scoop bucket add extras
scoop bucket add versions

$f = (Get-Content scoop-packages) -as [string[]]
$i=1

foreach ($l in $f) {
    scoop install $l
    $i++
}

Write-Host "############"
Write-Host "wingetによるアプリインストールを実施"
Write-Host "############"

$f = (Get-Content winget-packages) -as [string[]]
$i=1

foreach ($l in $f) {
    winget install -e --id $l
    $i++
}

Write-Host "############"
Write-Host "font settings"
Write-Host "############"
.\init\font.ps1

Write-Host "############"
Write-Host "install powershell modules"
Write-Host "############"
.\init\modules.ps1

Write-Host "############"
Write-Host "install wsl"
Write-Host "############"
wsl --install -d Ubuntu
