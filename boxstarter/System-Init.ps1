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
cinst autohotkey
cinst vscode
cinst microsoft-windows-terminal
cinst LinkShellExtension
cinst slack
cinst spotify
cinst discord
cinst windowsfirewallcontrol
cinst transmission
cinst zoom
cinst git
cinst nodejs
cinst powershell-core
cinst peazip
cinst vcxsrv
cinst obs-studio
cinst screentogif
cinst greenshot
cinst vlc
cinst firacodenf
cinst voicemeeter

# Command line tools
cinst awscli
cinst bat
cinst RunInBash
cinst bottom
cinst fzf
cinst fd
cinst ripgrep
cinst sd

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
