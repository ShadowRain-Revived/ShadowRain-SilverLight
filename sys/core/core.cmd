@Echo Off
If "%1"=="-PreInit" If "%2"=="Core_Core" Goto Core_Core
Exit

:Core_Core
:: Globals
Set "Core_Version=0.0.1"
Set "Core_Directory=%cd%"
Set "Core_Arch=CS"

:: Architecture Variables (Only edit if making a custom core)
Set "Core_ArchVersion=0.0.1"
Set "Core_ArchName=Cyan Silver"

:: Features
:: Allow system files to be directly loaded?
Set "Core_AllowModuleOffSet=True"
:: Require user login on boot?
Set "Core_RequireUser=False"
:: Enable Graphics (color)?
Set "Core_EnableGraphics=True"
:: Enable user authentication control (requiring passwords to login, etc)?
Set "Core_EnableUserAuthentication=True"

:: Reload client script
If Defined Core_Version (
	If Defined Core_Directory (
		If Defined Core_Arch (
			:: Not Required To Boot
			If Defined Core_ArchVersion Set "Core_HasVersion=1"
			If Defined Core_ArchName Set "Core_HasName=1"
			:: Define Core Arch Version and Core Arch Name If They Don't Exist
			If Not Defined Core_ArchVersion Set "Core_ArchVersion=Unknown"
			If Not Defined Core_ArchName Set "Core_ArchName=Unknown"
			
			:: Jump Back to System
			Set "Core_IsPreLoaded=True"
			If Exist "%cd%\sys_init.cmd" (
				sys_init -CorePreLoaded Core_Core True
			) Else (
				Echo Missing required system file "sys_init.cmd"
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