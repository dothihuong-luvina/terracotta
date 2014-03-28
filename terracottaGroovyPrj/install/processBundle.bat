@echo off
SET CUR_DIR=%~dp0
SET SPECIAL_PROCESS=FALSE
for %%x in (%*) do (
  if "%%x" == "-sp" (
  	SET SPECIAL_PROCESS=TRUE
  )
  if "%%x" == "-h" (
  	call:usage
	goto:eof
  )
)

FOR /F "eol=; tokens=1,2,3 delims=, " %%i in (listBundle.txt) do (
	echo Artifact: %%i
	echo Destination: %%j 
	echo Repository: %%k
	if not exist %%j  (
		mkdir %%j 
	)
	call getBundle.bat %%i %CUR_DIR%%%j %%k || goto:ERROR
)
            
:: For custom bundle like custom quartz, custom terracotta
if "%SPECIAL_PROCESS%"=="TRUE" (
	specialBundleProcess.bat
)

:ERROR
goto:eof