@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto Entry

:Loop
Set currentDir=%cd%
Cd !currentDir!
EndLocal
%cd%\0.0.1.cmd
Set Command=
Set "count=0"

:Entry
Set /P Command="<%cd%> "
For %%a In (!Command!) Do (
    Set /A count+=1
    Set Value!count!=%%a
)
If "!Value1!"=="md" Goto MkDir
If "!Value1!"=="mkdir" Goto MkDir
If "!Value1!"=="rd" Goto RD
If "!Value1!"=="rmdir" Goto RD
If "!Value1!"=="cls" Goto Clear
If "!Value1!"=="clear" Goto Clear
If "!Value1!"=="help" Goto Help
If "!Value1!"=="commands" Goto Help
If "!Value1!"=="refresh" Goto Refresh
If "!Value1!"=="dir" Goto Ls
If "!Value1!"=="ls" Goto Ls
If "!Value1!"=="time" Goto Time
If "!Value1!"=="date" Goto Date
If "!Value1!"=="log" Goto Log
If "!Value1!"=="sysinfo" Goto SysInfo
If "!Value1!"=="mkfile" Goto MkFile
If "!Value1!"=="delfile" Goto DelFile
Goto Entry

:MkDir
If "!Value2!"=="" (
	Echo.
	Echo Please specify what directory to make.
	Set Command=
	Goto Loop
)
If Exist "!Value2!" (
	Echo.
	Echo This directory already exists.
	Set Command=
	Goto Loop
)
Mkdir "!Value2!"
Echo '!Value2!' has been made.
Set Command=
Goto Loop

:RD
If Not Exist "!Value2!" (
	Echo.
	Echo This directory does not exist
	Set Command=
	Goto Loop
)
Set /P Confirm="Are you sure you want to delete !Value2!? (yes/no): "
If "!Confirm!"=="yes" (
	Rd /S /Q !Value2!
	Echo '!Value2!' has been deleted.
)
If Not "!Confirm!"=="yes" If Not "!Confirm!"=="no" (
	Echo Please answer yes or no only.
)
Set Command=
Goto Loop

:Clear
Cls
Set Command=
Goto Loop

:Help
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo ShadowRain Command List:
Echo.
Echo  - clear (Alias : cls) -- Clears the Console Window
Echo  - refresh -- Refreshes the Console Window (For Updates - Mainly a dev command)
Echo  - ls -- Shows the files in the directory
Echo  - help (Alias : commands) -- Shows this dialog
Echo  - time -- Shows the system time
Echo  - mkdir (Alias: md) -- Allows you to make a directory
Echo  - rmdir (Alias: rd) -- Allows you to delete a directory
Echo  - color -- Allows you to change the color in the console
Echo  - mkfile -- Allows you to make a file inside a directory (must specify ext)
Echo  - delfile -- Allows you to delete a file (must specify ext)
Echo  - date -- Displays the system date
Echo  - log -- Displays the system time and date
Echo  - sysinfo -- Displays the system information
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Loop

:Refresh
Set currentDir=%cd%
Cd !currentDir!
Echo Console Refreshed.
Goto Loop
Set Command=

:LS
Dir
Set Command=
Goto Loop

:Time
Echo The System Time is [%Time%].
Set Command=
Goto Loop

:Date
Echo Today's date is [%Date%]
Set Command=
Goto Loop

:Log
Echo.
Echo %Date% %Time%
Echo.
Set Command=
Goto Loop

:SysInfo
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Version: [ 0.0.1 ] - Release: [ Alpha ]
Echo.
Echo New updates here: [ https://github.com/ShadowRain-Revived/ShadowRain ] 
Echo For information join: [ https://discord.gg/VqjdxdE ]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Loop

:MkFile
If Exist "!Value2!" Echo This file already exists.
    
If Not Exist "!Value2!" (
	Echo "!Value3!" > "!Value2!"
	Echo '!Value2!' has been created.
)
Set Command=
Goto Loop

:DelFile
If Not Exist "!Value2!" (
	Echo '!Value2!' does not exist.
	Set Command=
	Goto Loop
)
If Exist "!Value2!"\* (
    Echo '!Value2!' is a directory. Use rmdir
    Set Command=
    Goto Loop
)
Set /P Response="Do you really want to delete '!Value2!'? (yes/no): "
If "!Response!"=="yes" (
	Del /Q "!Value2!"
	Echo '!Value2!' has been deleted.
	Set Command=
	Goto Loop
)
If Not "!Response!"=="yes" If Not "!Response!"=="no" (
	Echo Please answer yes or no only.
	Set Command=
	Goto Loop
)
Set Command=
Goto Loop
