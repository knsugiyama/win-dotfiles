Import-Module oh-my-posh
# Set-PoshPrompt Parabox
Set-PoshPrompt $env:USERPROFILE\.dotfiles\.files\.mytheme.omp.json
Import-Module PSReadLine
Import-Module -Name Terminal-Icons

# Alias
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Functions
function prj {
    ghq.exe look $(ghq list | peco.exe)
}

function make_init() {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
    powershell $env:USERPROFILE\.dotfiles\etc\init.ps1
}

function make_deploy() {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
    powershell $env:USERPROFILE\.dotfiles\etc\deploy.ps1
}

function make_install() {
    make_init
    make_deploy
}

function make_update() {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
    powershell $env:USERPROFILE\.dotfiles\etc\update.ps1
    make_deploy
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
