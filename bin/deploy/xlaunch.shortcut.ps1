# ショートカットを作る
$WsShell = New-Object -ComObject WScript.Shell
$Shortcut = $WsShell.CreateShortcut("$HOME\.dotfiles\config\vcxsrv\xlaunch.exe.lnk")
#リンク先パス設定
$Shortcut.TargetPath = "$HOME\scoop\apps\vcxsrv\current\xlaunch.exe"
$Shortcut.Arguments = ' -run ' + "$HOME\.dotfiles\config\vcxsrv\config.xlaunch"
# 作業フォルダ
$Shortcut.WorkingDirectory = "$HOME\scoop\apps\vcxsrv\current"
$Shortcut.Save()

$StartupDirectory = [Environment]::GetFolderPath('Startup')
cp $HOME\.dotfiles\config\vcxsrv\xlaunch.exe.lnk $StartupDirectory\xlaunch.exe.lnk
