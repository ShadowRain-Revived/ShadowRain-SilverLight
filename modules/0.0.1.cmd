@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion
if "%1"=="" Goto Entry

:Loop
Set currentDir=%cd%
::Cd !shadowDir!
EndLocal
::modules\0.0.4.bat -LoadModule
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
If "!Value1!"=="rd" Goto RD
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
