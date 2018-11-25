@Echo Off
If "%1"=="-LoadCore" Goto LoadCore
:: If "%1"=="-LoadBack" Goto LoadBack
Exit

:LoadCore
core\core.cmd

:: :LoadBack
:: will add stuff here later
