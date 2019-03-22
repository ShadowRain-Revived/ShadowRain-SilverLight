@Echo Off
If "%1"=="-PreInit" If "%2"=="Graphics.Graphics" Goto Graphics.Graphics
If "%Core.AllowModuleOffSet%"=="False" (
	Echo Unable to run file directly, It is disallowed by the core.
	Exit
)

:Graphics.Graphics
If Not Defined Graphics.Graphics Set "Graphics.Graphics=LightEngine"
If Not Defined Graphics.Version Set "Graphics.Version=0.0.1"
If "%Core.EnableGraphics%"=="True" (
	:: ::::::::::::::::::::::::::::::::::::::::::: ::
	::        ShadowRain Graphics Globals          ::
	:: ::::::::::::::::::::::::::::::::::::::::::: ::
	
	:: ShadowRain's Default color is Purple (0D)
	If Not Defined Graphics.DefaultColor Set "Graphics.DefaultColor=0D"
	
	:: Color when processing Information (0B)
	If Not Defined Graphics.Information Set "Graphics.Information=0B"
	
	:: Color when processing an install script (8F)
	If Not Defined Graphics.ScriptColor Set "Graphics.ScriptColor=8F"
	
	:: Color when processing an error (04)
	If Not Defined Graphics.ErrorColor Set "Graphics.ErrorColor=04"
	
	:: Color when processing a major system fault (5F)
	If Not Defined Graphics.SystemFault Set "Graphics.SystemFault=5F"
) Else (
	:: All colors when not enabled is 0F
	If Not Defined Graphics.DefaultColor Set "Graphics.DefaultColor=0F"
	If Not Defined Graphics.Information Set "Graphics.Information=0F"
	If Not Defined Graphics.ScriptColor Set "Graphics.ScriptColor=0F"
	If Not Defined Graphics.ErrorColor Set "Graphics.ErrorColor=0F"
	If Not Defined Graphics.SystemFault Set "Graphics.SystemFault=0F"
)

:: Check if all required values are set.
If Defined Graphics.DefaultColor (
	If Defined Graphics.Information (
		If Defined Graphics.ScriptColor (
			If Defined Graphics.ErrorColor (
				If Defined Graphics.SystemFault (
					Goto Graphics.loadGraphics
				) Else (
					:: value "Graphics.SystemFault" isn't set
				)
			) Else (
				:: value "Graphics.ErrorColor" isn't set
			)
		) Else (
			:: value "Graphics.ScriptColor" isn't set
		)
	) Else (
		:: value "Graphics.Information" isn't set
	)
) Else (
	:: value "Graphics.DefaultColor" isn't set
)

:Graphics.loadGraphics
:: Set color to default
Color %Graphics.DefaultColor%
:: Reload into system
If Exist "%cd%\..\sys_init.cmd" (
	Pushd "%cd%\.."
	sys_init -GraphicsPreLoaded Graphics.loadGraphics True
) Else (
	Echo Missing required system file "core_init.cmd"
	Pause>Nul
)