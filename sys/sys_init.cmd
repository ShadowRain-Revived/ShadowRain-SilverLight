@Echo Off
:: Load the core.
If "%1"=="-LoadCore" If "%2"=="PreInit" If "%3"=="System.System" Goto System.loadCore
:: Core is loaded, Load Graphics (Not ready).
If "%1"=="-CorePreLoaded" If "%2"=="Core.Core" If "%3"=="True" Goto System.loadGraphics
:: Graphics is loaded, Load other system files.
If "%1"=="-GraphicsPreLoaded" If "%2"=="Graphics.loadGraphics" If "%3"=="True" Goto System.loadSystem
If "%Core.AllowModuleOffSet%"=="False" (
	Echo Unable to run file directly, It is disallowed by the core.
	Exit
)
	
:System.loadCore
core\core -PreInit Core.Core
Echo Something happened.
Exit

:: Not ready yet
:System.loadGraphics
If "%Core.IsPreLoaded%"=="True" (
	graphics\graphics -PreInit Graphics.Graphics
	Echo Something happened.
	Exit
) Else (
	Echo The core was not loaded correctly.
	Exit
)
Exit

:: Also not ready yet
:System.loadSystem
:: Check that everything still exists
If Exist "core\core" (
	If Exist "graphics\graphics" (
		:: Other system files here
		If Exist "sys\ErrorHandler" (
			If Exist "sys\UacSys" (
				If Exist "sys\CommandHandler" (
					:: everything is OK
				) Else (
					:: CommandHandler missing
				)
			) Else (
				:: UacSys missing
			)
		) Else (
			:: ErrorHandler missing
		)
	) Else (
		:: graphics missing
	)
) Else (
	:: core is missing (I'd honestly be surprised if this were the case)
)
