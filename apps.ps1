# PROGRAMS
$programs = @(
	# @{name = "Microsoft.WindowsTerminal"; version = "1.18.2822.0"},                       # Terminal
	# @{name = "Git.Git";	version = "2.42.0.2"},                                          # SCM and VCS
	# @{name = "GitHub.GitLFS"; version = "3.4.0"},                                         # Complement to Git
	# @{name = "GitHub.cli"; version = "2.39.1"},                                           # Auxiliary bridge to Git in Github
	# @{name = "Notepad++.Notepad++";	version = "8.5.8"},                                 # Minimal Text Editor
	# @{name = "Obsidian.Obsidian"; version = "1.4.16"},                                    # Text note manager
	# @{name = "Microsoft.VisualStudioCode"; version = "1.84.2"},                           # Master Text Editor
	# @{name = "NickeManarin.ScreenToGif"; version = "2.39.0.0"},                           # GIF Tool
	# @{name = "Inkscape.Inkscape"; version = "1.3"},                                       # Vector Drawing
	# @{name = "GIMP.GIMP"; version = "2.10.36"},                                           # Raster Drawing
	# @{name = "BleuBleu.FamiStudio"; version = "4.0.6"},                                   # Audio make
	# @{name = "LMMS.LMMS"; version = "1.2.2"},                                             # Audio make, edit, remix, etc
	# @{name = "Meltytech.Shotcut"; version = "23.09.29"},                                  # Video edit, remix, etc
	# @{name = "BlenderFoundation.Blender.LTS"; version = "4.1"},                           # 3D Tool
	# @{name = "GodotEngine.GodotEngine"; version = "4.1.3"}                                # Game Engine
	# @{name = "Unity.UnityHub"; version = "3.6.1"},                                        # Game Engine (Big)
	# @{name = "7zip.7zip"; version = "23.01"},                                             # Compression tool
	# @{name = "OpenJS.NodeJS.LTS"; version = "20.9.0"}                                     # Cross-platform JavaScript runtime environment.
	# @{name = "Docker.DockerDesktop"},                                                     # Container Build
	# @{name = "Prusa3D.PrusaSlicer.Alpha"; version = "2.6.0-rc2"}                          # Cross-platform JavaScript runtime environment.
	# @{name = "Prusa Slicer"; id = "Prusa3D.PrusaSlicer.Alpha"; version = "2.6.0-rc2" },
	# @{name = "Cascadeur"; id = "XPFMG5VK7FJPXL" }
	# @{name = "Krita"; id = "KDE.Krita"; version = "5.2.2" },
	# @{name = "StreamlabsOBS"; id = "Streamlabs.Streamlabs"; version = "0.23.2" },
	# @{name = "NVIDIA GeForce Experience"; id = "Nvidia.GeForceExperience"; version = "3.27.0.120" }
	# @{name = "EpicGames"; id = "EpicGames.EpicGamesLauncher"; version = "1.3.93.0" }
	# @{name = "Steam"; id = "Valve.Steam"; version = "2.10.91.91" }
)

$binaries = @(
	# @{ "name" = "pureref.exe"; uri = "https://www.pureref.com/files/build.php?build=WIN64.exe&version=1.11.1&downloadKey=ppj1vJHxy3Mo7XpCtOrwEA==" },
	# @{ "name" = "quixelmixer.exe"; uri = "https://d2shgxa8i058x8.cloudfront.net/mixer/win/Quixel_Mixer_2022.1.1_Beta.exe" }
)

Foreach ($program in $programs)
{
	Write-Host "Getting the list of programs..."
	$programList = winget list --exact -q $program.name
	
	Write-Host "Starting the installation."
	if (![String]::Join("", $programList).Contains($program.name)) {
		Write-host "Installing:" $program.name "Version:" $program.version
        if ($program.source -ne $null)
		{
            winget install --exact $program.name --version $program.version --source $program.source --accept-package-agreements --accept-source-agreements --silent
        }
        else
		{
            winget install --exact $program.name --version $program.version --accept-package-agreements  --accept-source-agreements --silent
        }
	}
	else
	{
		Write-host "Skipping Install of " $program.name
	}
} 

# BINARIES
Foreach ($binarie in $binaries)
{
	Write-host "Get" $binarie.name "from:" $binarie.uri
	wget -UseBasicParsing $binarie.uri -out $binarie.name
}
