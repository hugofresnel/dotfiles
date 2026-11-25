#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$distro = "Debian"
$linuxUser = (wsl -d $distro -- whoami).Trim()

if (!$linuxUser) {
    throw "Unable to detect WSL username."
}

$source = "/home/$linuxUser/.config/Code/User"
$target = "$env:APPDATA\Code\User"

$items = @(
    "settings.json",
    "keybindings.json",
    "snippets/shellscript.json"
)

New-Item -ItemType Directory -Force -Path $target | Out-Null

foreach ($item in $items) {
    # Resolve actual path
    $resolved = (wsl -d $distro -- readlink -f "$source/$item").Trim()

    if (!$resolved) {
        Write-Warning "Unable to resolve: $item"
        continue
    }

    $sourcePath = "\\wsl.localhost\$distro$($resolved -replace '/', '\')"
    $targetPath = Join-Path $target $item

    if (!(Test-Path -LiteralPath $sourcePath)) {
        Write-Warning "Source not found: $sourcePath"
        continue
    }

    # Create the symbolic link
    New-Item -ItemType SymbolicLink `
        -Path $targetPath `
        -Target $sourcePath `
        -Force | Out-Null

    if (!(Test-Path -LiteralPath $targetPath)) {
        throw "Link verification failed: $targetPath"
    }

    Write-Host "Linked: $item"
}
