@Echo Off
:Core
:: Globals
Set "Core_Version=0.0.1"
Set "Core_Directory=%cd%"
Set "Core_Arch=CS"

:: Architecture Variables (Only edit if making a custom core)
Set "Core_ArchVersion=0.0.1"
Set "Core_ArchName=Cyan Silver"

:: Features (0 = False, 1 = True)
:: Allow system files to be directly loaded?
Set "Core_AllowModuleOffSet=0"
:: Require user login on boot?
Set "Core_RequireUser=1"
:: Enable Graphics (color)?
Set "Core_EnableGraphics=1"
:: Enable user authentication control (requiring passwords to login, etc)?
Set "Core_EnableUserAuthentication=1"

:: Reload client script here (to be done later)
