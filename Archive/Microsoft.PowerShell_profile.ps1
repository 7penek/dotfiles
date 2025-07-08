function Get-NeoVim { & nvim $args }
New-Alias -Name v -Value Get-NeoVim -Force -Option AllScope
New-Alias -Name c -Value Clear-Host -Force -Option AllScope
function Get-CClear { & cd "$args" && Clear-Host }
New-Alias -Name cc -Value Get-CClear -Force -Option AllScope

function Get-GitReset { & git reset --hard && git clean -fdx }
New-Alias -Name g0 -Value Get-GitReset -Force -Option AllScope
function Get-GitQuick { & git add -A && git commit -m $args }
New-Alias -Name gg -Value Get-GitQuick -Force -Option AllScope
function Get-GitPush { & git push $args }
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope
function Get-GitPull { & git pull $args }
New-Alias -Name gpl -Value Get-GitPull -Force -Option AllScope

function Get-GitStatus { & git status -sb $args }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope
function Get-GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gt -Value Get-GitTree -Force -Option AllScope

function Get-GitAdd { & git add $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope
function Get-GitCommit { & git commit -m $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope
function Get-GitCommit { & git commit -ev $args }
New-Alias -Name gcm -Value Get-GitCommit -Force -Option AllScope
function Get-GitCheckout { & git checkout $args }
New-Alias -Name gco -Value Get-GitCheckout -Force -Option AllScope

function Get-GitFetch { & git fetch $args }
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope
function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope
function Get-GitRemote { & git remote -v $args }
New-Alias -Name gr -Value Get-GitRemote -Force -Option AllScope

$ENV:STARSHIP_CONFIG = "$HOME\starship.toml"
Invoke-Expression (&starship init powershell)