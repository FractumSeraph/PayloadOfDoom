# This is currently a powershell script with too many comments, but it will eventually be converted to DuckyScript.

# Title: Payload of doom
# Author: FractumSeraph
# Version: 0.0
# Target: Windows 10-11

$DoomEngineDownloadPath = "C:\Doom\"

$DoomURL = "http://cdn.debian.net/debian/pool/non-free/d/doom-wad-shareware/doom-wad-shareware_1.9.fixed.orig.tar.gz"
$DoomZip = "doom-wad-shareware_1.9.fixed.orig.tar.gz"

$DoomEngineURL = "https://github.com/fabiangreffrath/crispy-doom/releases/download/crispy-doom-6.0/crispy-doom-6.0.0-win64.zip"
$DoomEngineZip = "crispy-doom-6.0.0-win64.zip"

#Create the directory.
md -Force $DoomEngineDownloadPath

#Move to this directory.
cd $DoomEngineDownloadPath

#Download the Crspy Dooom engine.
Start-BitsTransfer -Source $DoomEngineURL -Destination $DoomEngineDownloadPath

#Extract the engine.
Expand-Archive -Path $DoomEngineZip -DestinationPath $DoomEngineDownloadPath

#Download the Doom game.
Start-BitsTransfer -Source $DoomURL -Destination $DoomEngineDownloadPath

#Extract the downloaded game.
tar -xvzf .\doom-wad-shareware_1.9.fixed.orig.tar.gz

#Launch the game.
.\crispy-doom.exe -iwad .\doom-wad-shareware-1.9.fixed\doom1.wad