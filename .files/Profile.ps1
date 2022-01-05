Import-Module oh-my-posh
Set-PoshPrompt Parabox
Import-Module PSReadLine

# Alias
Set-Alias ll ls
Set-Alias grep findstr

# Functions
function g {
    ghq.exe look $(ghq list | peco.exe)
}

function make_init() {
    powershell -ExecutionPolicy Bypass -File $env:USERPROFILE\.dotfiles\bin\init\init.ps1
}

function make_deploy() {
    powershell -ExecutionPolicy Bypass -File $env:USERPROFILE\.dotfiles\bin\deploy\deploy.ps1
}

function make_install() {
    make_init
    make_deploy
}

function make_update() {
    powershell -ExecutionPolicy Bypass -File $env:USERPROFILE\.dotfiles\update.ps1
}

# psreadline
## Fish風の自動補完
Set-PSReadLineOption -PredictionSource History
# (optional) Ctrl+f 入力で前方1単語進む : 補完の確定に使う用
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord
## 重複したリストを残さない
Set-PSReadlineOption -HistoryNoDuplicates
## 区切り文字
Set-PSReadLineOption -WordDelimiters ";:,.[]{}()/\|^&*-=+'`" !?@#$%&_<>「」（）『』『』［］、，。：；／"
# zsh風のtab補完
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Keymap
Set-PSReadlineKeyHandler -Key ctrl+d -Function DeleteCharOrExit
