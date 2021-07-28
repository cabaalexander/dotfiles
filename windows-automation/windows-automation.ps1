# constants
$CHOCO_URL = 'https://chocolatey.org/install.ps1'

# install chocolatey only if it is not installed already
if (-Not (Get-Command choco -errorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol =
        [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression (
        (New-Object System.Net.WebClient).DownloadString($CHOCO_URL)
    )
}

# array of apps to install
$apps = @(
    # apps
    'discord'
    'spotify'
    'sharpkeys'
    'synergy'

    # stream
    'elgato-game-capture'
    'streamlabs-obs'
    'livesplit'

    # stats
    'icue'
    'msiafterburner'
    'coretemp'

    # games
    'steam-client'
    'epicgameslauncher'
)

# capture installed apps to later check which ones are installed
$installed_apps = choco list --local-only

# install all apps
foreach ($app in $apps) {
    # install app if not already installed
    if (-Not ($installed_apps | Select-String -Pattern $app)) {
        choco install -y $app
    }
}
