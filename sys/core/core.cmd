@Echo Off
If "%1"=="-PreInit" If "%2"=="Core.Core" Goto Core.Core
Exit

:Core.Core
:: Globals
Set "Core.Version=0.0.1"
Set "Core.Directory=%cd%"
Set "Core.Arch=CS"

:: Architecture Variables (Only edit if making a custom core)
Set "Core.ArchVersion=0.0.1"
Set "Core.ArchName=Cyan Silver"

:: Features
:: Allow system files to be directly loaded?
Set "Core.AllowModuleOffSet=False"
:: Require user login on boot?
Set "Core.RequireUser=True"
:: Enable Graphics (color)?
Set "Core.EnableGraphics=True"
:: Enable user authentication control (requiring passwords to login, etc)?
Set "Core.EnableUserAuthentication=True"

:: Reload client script
If Defined Core.Version (
	If Defined Core.Directory (
		If Defined Core.Arch (
			:: Not Required To Boot
			If Defined Core.ArchVersion Set "Core.HasVersion=1"
			If Defined Core.ArchName Set "Core.HasName=1"
			:: Define Core Arch Version and Core Arch Name If They Don't Exist
			If Not Defined Core.ArchVersion Set "Core.ArchVersion=Unknown"
			If Not Defined Core.ArchName Set "Core.ArchName=Unknown"
			
			:: Jump Back to System
			Set "Core.IsPreLoaded=True"
			If Exist "%cd%\..\sys_init.cmd" (
				Pushd "%cd%\.."
				sys_init -CorePreLoaded Core.Core True
			) Else (
				Echo Missing required system file "core_init.cmd"
				Pause>Nul
			)
		) Else (
			Echo Missing Core Architecture ID!
			Pause>Nul
		)
	) Else (
		Echo Missing Core Directory!
		Pause>Nul
	)
) Else (
	Echo Missing Core Version!
	Pause>Nul
)
