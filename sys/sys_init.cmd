@Echo Off
:: Load the core.
If "%1"=="-LoadCore" If "%2"=="PreInit" If "%3"=="System_System" Goto System_LoadCore
:: Core is loaded, Load Graphics (Not ready)_
If "%1"=="-CorePreLoaded" If "%2"=="Core_Core" If "%3"=="True" Goto System_LoadGraphics
:: Graphics is loaded, Load other system files_
If "%1"=="-GraphicsPreLoaded" If "%2"=="Graphics_LoadGraphics" If "%3"=="True" Goto System_LoadSystem
If "%Core_AllowModuleOffSet%"=="False" (
	Echo Unable to run file directly, It is disallowed by the core.
	Exit
)
Exit

:System_LoadCore
If "%4"=="debug" Set "DebugMode=True"
core\core -PreInit Core_Core
Echo Something happened.
Exit

:: Not ready yet
:System_LoadGraphics
If "%Core_IsPreLoaded%"=="True" (
	graphics\graphics -PreInit Graphics_Graphics
	Echo Something happened.
	Exit
)
Echo The core was not loaded correctly.
Exit

:: Also not ready yet
:System_LoadSystem
Pause
If Exist "core\core" If Exist "graphics\graphics" (
	Cd ..\modules
	Pause
	0.0.1.bat
	Echo Something happened.
	Pause>Nul
	Exit
	:: Other system files here
	If Exist "sys\ErrorHandler" If Exist "sys\UacSys" If Exist "sys\CommandHandler" (
		:: everything is OK
	)
)
