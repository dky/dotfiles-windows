Set-PSReadlineOption -BellStyle None

# Docker
function docker-ps { docker ps -a }
	Set-Alias dkps docker-ps

function docker-kill { docker kill $(docker ps -q) }
	Set-Alias dkrma docker-kill

function docker-images { docker images }
	Set-Alias dkls docker-images

function docker-rm-exited { docker rm $(docker ps -a -f status=exited -q) }
	Set-Alias dkrmce docker-rm-exited

function docker-rm-force($a) { docker rm -f $a }
	Set-Alias dkrmcf docker-rm-force

function docker-exec-powershell($a) { docker exec -it $a powershell }
	Set-Alias dkeps docker-exec-powershell

# House-keeping
function cd-profile { cd $env:USERPROFILE\Documents\WindowsPowerShell\ }
	Set-Alias cdp cd-profile

function cd-home { cd $HOME }
	Set-Alias cdh cd-home

function edit-profile { vim $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 }
	Set-Alias vimp edit-profile

function Reload-Profile {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }
}
Set-Alias srcp Reload-Profile

# Git
function git-status { git status }
	Set-Alias gs git-status

function git-add { git . }
	Set-Alias ga git-add

function git-commit-am($a) { git commit -a -m $a }
	Set-Alias gma git-commit-am

function git-push-origin-master { git push origin master }
	Set-Alias gpu git-push-origin-master

function git-pull-origin-master { git pull origin master }
	Set-Alias gpd git-pull-origin-master

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
