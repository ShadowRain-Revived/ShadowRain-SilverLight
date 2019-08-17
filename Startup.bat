@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" cmd /k %0 -GetCoreInformation
If "%1"=="-GetCoreInformation" Goto Core_Information

:Core_Information
rem ### Core Information ###
Set Core_Name="Cyan Silver"
Set Core_Version="0.1"
Set Core_Arch="CS"

rem ### Core Features ###
Set Core_EnableDefaults="True"
Set Core_EnableGraphics="True"
Set Core_EnableExtendedSecurity="True"
Set Core_EnableWildStart="False"

rem ### Core Defaults ###
Set Core_DefaultMode="con: cols=120 lines=25"

rem ### Check all variables are set ###
If Defined Core_Name (
	If Defined Core_Version (
		If Defined Core_Arch (
			If Defined Core_EnableDefaults (
				If Defined Core_EnableGraphics (
					Color 0B
					If Defined Core_EnableExtendedSecurity (
						If Defined Core_EnableWildStart (
							If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
							Goto Core_Startup
						) Else (
							Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
							Exit
						)
					) Else (
						Echo Fatal Error: Core is missing required feature EnabledExtendedSecurity - Please send a bug report immediately.
						Exit
					)
				) Else (
					Color 0F
					Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
					rem ### Loopback the check if graphics arent enabled @ EnabledExtendedSecurity ###
					If Defined Core_EnableExtendedSecurity (
						If Defined Core_EnableWildStart (
							If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
							Goto Core_Startup
						) Else (
							Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
							Exit
						)
					) Else (
						Echo Fatal Error: Core is missing required feature EnabledExtendedSecurity - Please send a bug report immediately.
						Exit
					)
				)
			) Else (
				Echo Fatal Error: Core is missing required feature EnableDefaults - Please send a bug report immediately.
				Exit
			)
		) Else (
			Set "Core_Arch"=="Unknown"
			rem ### Loopback the check if Core_Arch wasnt defined @ EnableGraphics
			If Defined Core_EnableGraphics (
				Color 0B
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately.
					Exit
				)
			) Else (
				Color 0F
				Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately
					Exit
				)
			)
		)
	) Else (
		rem ### Loopback the check is Core_Version wasnt defined @ Core_Arch
		Set "Core_Version"=="Unknown"
		If Defined Core_Arch (
			If Defined Core_EnableGraphics (
				Color 0B
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately.
					Exit
				)
			) Else (
				Color 0F
				Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately
					Exit
				)
			)
		) Else (
			Set "Core_Arch"=="Unknown"
			rem ### Loopback the check if Core_Arch wasnt defined @ EnableGraphics
			If Defined Core_EnableGraphics (
				Color 0B
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately.
					Exit
				)
			) Else (
				Color 0F
				Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately
					Exit
				)
			)
		)
	)
) Else (
	Set "Core_Name"=="Unknown"
	rem ### Loopback the check if Core_Name wasnt defined @ Core_Version
	If Defined Core_Version (
		If Defined Core_Arch (
			If Defined Core_EnableDefaults (
				If Defined Core_EnableGraphics (
					Color 0B
					If Defined Core_EnableExtendedSecurity (
						If Defined Core_EnableWildStart (
							If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
							Goto Core_Startup
						) Else (
							Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
							Exit
						)
					) Else (
						Echo Fatal Error: Core is missing required feature EnabledExtendedSecurity - Please send a bug report immediately.
						Exit
					)
				) Else (
					Color 0F
					Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
					rem ### Loopback the check if graphics arent enabled @ EnabledExtendedSecurity ###
					If Defined Core_EnableExtendedSecurity (
						If Defined Core_EnableWildStart (
							If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
							Goto Core_Startup
						) Else (
							Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
							Exit
						)
					) Else (
						Echo Fatal Error: Core is missing required feature EnabledExtendedSecurity - Please send a bug report immediately.
						Exit
					)
				)
			) Else (
				Echo Fatal Error: Core is missing required feature EnableDefaults - Please send a bug report immediately.
				Exit
			)
		) Else (
			Set "Core_Arch"=="Unknown"
			rem ### Loopback the check if Core_Arch wasnt defined @ EnableGraphics
			If Defined Core_EnableGraphics (
				Color 0B
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately.
					Exit
				)
			) Else (
				Color 0F
				Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately
					Exit
				)
			)
		)
	) Else (
		rem ### Loopback the check is Core_Version wasnt defined @ Core_Arch
		Set "Core_Version"=="Unknown"
		If Defined Core_Arch (
			If Defined Core_EnableGraphics (
				Color 0B
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately.
					Exit
				)
			) Else (
				Color 0F
				Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately
					Exit
				)
			)
		) Else (
			Set "Core_Arch"=="Unknown"
			rem ### Loopback the check if Core_Arch wasnt defined @ EnableGraphics
			If Defined Core_EnableGraphics (
				Color 0B
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately.
					Exit
				)
			) Else (
				Color 0F
				Echo Warning: The core reports a feature that should be enabled is disabled, Continuing.
				If Defined Core_EnableExtendedSecurity (
					If Defined Core_EnableWildStart (
						If "!Core_EnableWildStart!"=="True" Echo Warning: The core reports a feature that should be disabled is enabled, Continuing.
						Goto Core_Startup
					) Else (
						Echo Fatal Error: Core is missing required feature EnableWildStart - Please send a bug report immediately.
						Exit
					)
				) Else (
					Echo Fatal Error: Core is missing required feature EnableExtendedSecurity - Please send a bug report immediately
					Exit
				)
			)
		)
	)
)
Exit

:Core_Startup
Echo Somehow we made it this far.
Pause>Nul
