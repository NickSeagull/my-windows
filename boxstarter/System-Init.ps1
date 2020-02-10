############################################
#                                          #
# SYSTEM INIT SCRIPT                       #
#                                          #
# Author: Nikita Tchayka (@nickseagull)    #
#                                          #
# Run with Install-BoxstarterPackage       #
#  Install-BoxStarterPackage -PackageName  #
#  <this script> -DisableReboots           #
############################################
Checkpoint-Computer -Description "Clean install" -RestorePointType "MODIFY_SETTINGS" # Create a restore point
Set-ExecutionPolicy RemoteSigned
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

############################################
#                                          #
# U T I L I T Y   F U N C T I O N S        #
#                                          #
############################################
function Set-Shortcut {
  param ( [string]$SourceLnk, [string]$DestinationPath )
  $WshShell = New-Object -comObject WScript.Shell
  $Shortcut = $WshShell.CreateShortcut($SourceLnk)
  $Shortcut.TargetPath = $DestinationPath
  $Shortcut.Save()
}

############################################
#                                          #
# S E T U P   D I R E C T O R I E S        #
#                                          #
############################################
mkdir $env:USERPROFILE\Projects

############################################
#                                          #
# P A C K A G E S   L I S T                #
#                                          #
############################################
cinst shutup10
cinst autohotkey
cinst todoist
cinst 1password
cinst manictime
cinst vscode
cinst microsoft-windows-terminal
cinst microsoft-edge-insider
cinst LinkShellExtension
cinst notion
cinst slack
cinst spotify
cinst discord
cinst RunInBash
cinst bat
cinst simplewall
cinst basecamp3
cinst filejuggler
cinst docker-desktop
cinst transmission
cinst zoom
cinst git
cinst nodejs
cinst windscribe
cinst wox
cinst visualstudio2019community  # required to work with native packages with Rust/TS
cinst hasklig
cinst typora
cinst watchexec
cinst powershell-core
cinst cmake      # required by visual studio for some packages
cinst vagrant
cinst haskell-stack
cinst diffutils  # required by emacs
cinst peazip
cinst FiraCode
cinst vcxsrv
cinst onenote
cinst obs-studio
cinst steam
cinst powershell-preview
cinst screentogif

############################################
#                                          #
# D E F E N D E R   E X C L U S I O N S    #
#                                          #
############################################

# Folder exclusions
@(

  "$env:USERPROFILE\Projects"

) | ForEach-Object {
  Add-MpPreference -ExclusionPath $_
}

# Process exclusions
@(

  "emacs",
  "npm",
  "node",
  "yarn",
  "git",
  "stack",
  "ghc",
  "nix"

) | ForEach-Object {
  Add-MpPreference -ExclusionProcess $_
}

# Add WSL paths to exclusions
$wslPaths = (Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | ForEach-Object { Get-ItemProperty $_.PSPath }).BasePath
$currentExclusions = $(Get-MpPreference).ExclusionPath
if (!$currentExclusions) {
  $currentExclusions = ''
}
$exclusionsToAdd = ((Compare-Object $wslPaths $currentExclusions) | Where-Object SideIndicator -eq "<=").InputObject
$dirs = @("\bin", "\sbin", "\usr\bin", "\usr\sbin", "\usr\local\bin", "\usr\local\go\bin")
if ($exclusionsToAdd.Length -gt 0) {
  $exclusionsToAdd | ForEach-Object {
    Add-MpPreference -ExclusionPath $_
    Write-Output "Added exclusion for $_"
    $rootfs = $_ + "\rootfs"
    $dirs | ForEach-Object {
      $exclusion = $rootfs + $_ + "\*"
      Add-MpPreference -ExclusionProcess $exclusion
      Write-Output "Added exclusion for $exclusion"
    }
  }
}

############################################
#                                          #
# S E T U P   MYWINDOWS   S E T T I N G S  #
#                                          #
############################################
git clone https://github.com/nickseagull/my-windows $env:USERPROFILE\Projects\my-windows
# The following line doesn't work, create the shortcut manually
# Set-Shortcut "$([environment]::GetFolderPath("Startup"))\main.lnk" "$env:USERPROFILE\Projects\my-windows\autohotkey\main.ahk"