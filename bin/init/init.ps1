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

Write-Host "#####"
Write-Host "dotfileのシンボリックリンクを作成"
Write-Host "#####"

Remove-Item "$HOME\.gitconfig"
sudo New-Item -Type SymbolicLink -Path $env:USERPROFILE\.gitconfig -Value $env:USERPROFILE\.dotfiles\.files\.gitconfig
Remove-Item "$HOME\.wslconfig"
sudo New-Item -Type SymbolicLink -Path $env:USERPROFILE\.wslconfig -Value $env:USERPROFILE\.dotfiles\.files\.wslconfig
