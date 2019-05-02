@Echo Off
If "%1"=="-PreInit" If "%2"=="Graphics_Graphics" Goto Graphics_Graphics
If "%Core_AllowModuleOffSet%"=="False" (
	Echo Unable to run file directly, It is disallowed by the core
	Exit
)

:Graphics_Graphics
Set "Graphics_Graphics=LightEngine" 
Set "Graphics_Version=0.0.1"
If "%Core_EnableGraphics%"=="True" Set "hasColor=True"
If "%hasColor%"=="True" Set "Graphics_DefaultColor=0D" 
If "%hasColor%"=="True" Set "Graphics_Information=0B"
If "%hasColor%"=="True" Set "Graphics_ScriptColor=8F" 
If "%hasColor%"=="True" Set "Graphics_ErrorColor=04"
If "%hasColor%"=="True" Set "Graphics_SystemFault=5F"
If "%hasColor%"=="True" Goto Graphics_CheckGraphics

Set "Graphics_DefaultColor=0F"
Set "Graphics_Information=0F"
Set "Graphics_ScriptColor=0F"
Set "Graphics_ErrorColor=0F"
Set "Graphics_SystemFault=0F"

:Graphics_CheckGraphics
:: Check if all required values are set.
If "%Graphics_DefaultColor%"=="0D" If "%Graphics_Information%"=="0B" If "%Graphics_ScriptColor%"=="8F" If "%Graphics_ErrorColor%"=="04" If "%Graphics_SystemFault%"=="5F" If "%Core_EnableGraphics%"=="True" Goto Graphics_LoadGraphics
If "%Graphics_DefaultColor%"=="0F" If "%Graphics_Information%"=="0F" If "%Graphics_ScriptColor%"=="0F" If "%Graphics_ErrorColor%"=="0F" If "%Graphics_SystemFault%"=="0F" If "%Core_EnableGraphics%"=="False" Goto Graphics_LoadGraphics
:: Error occured, handle it here?
Exit

:Graphics_LoadGraphics
:: Set color to default
Color %Graphics_DefaultColor%
:: Reload into system
If Exist "%cd%\sys_init.cmd" sys_init -GraphicsPreLoaded Graphics_LoadGraphics True
Echo Missing required system file "sys_init.cmd"
Pause>Nul
