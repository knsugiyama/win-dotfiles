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
