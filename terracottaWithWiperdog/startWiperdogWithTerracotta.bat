@echo off
cls
SET CUR_DIR=%CD%

:installDefault
    echo [Default option: Install wiperdog with JobManager and Terracotta. Everything will be gotten from maven, svn or github if not exits]
    SET uchoice=
    SET /P uchoice=You did not specify any option, would you like to install with default option[Yy(default)/Other key to exit]?
    if "%uchoice%" == "" goto:eof
    if not "%uchoice%" == "y" (
        if not "%uchoice%" == "Y" (
            goto:eof
        )
    )    
    pause
    call:usage
    @rem Get wiperdog installer from maven
    if not exist wiperdog-assembly.jar ( 
        call %CUR_DIR%\getWiperdog.bat || GOTO HANDLE_FAIL
    )
    
    @rem Install wiperdog
    call %CUR_DIR%\installWiperdog.bat || GOTO HANDLE_FAIL
    
    @rem Checkout Quartz from SVN and install if not exits
    call %CUR_DIR%\checkoutAndInstallQuartz.bat || GOTO HANDLE_FAIL
    
    @rem Config data (using JobManager bundle)
    call %CUR_DIR%\configureWithJobManager.bat || GOTO HANDLE_FAIL
    
    @rem Run wiperdog
    call %CUR_DIR%\runWiperdog.bat
goto:eof

:usage
    echo This is a reproduce wiperdog with terracotta script.
	echo startWiperdogWithTerracotta.bat [options]
	echo options : 
	echo - /gw : Get wiperdog installer from maven
	echo - /iw : Install wiperdog from the installer
	echo - /wjm : Use JobManager bundle in the wiperdog [If not, use JobManger embered in Groovy script]
	echo - /rw : Run wiperdog
	echo - /h : Open help
goto:eof
set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% == 0 (  
    call:installDefault
	goto:eof
)

# Default value of variables
SET GET_WIPERDOG="FALSE"
SET INSTALL_WIPERDOG="FALSE"
SET WITH_JOB_MANAGER="FALSE"
SET RUN_WIPERDOG="FALSE"

# Get input parameters
for %%x in (%*) do (
  if "%%x" == "/gw" (
  	SET GET_WIPERDOG="TRUE"
  )
  if "%%x" == "/iw" (
  	SET INSTALL_WIPERDOG="TRUE"
  )
  if "%%x" == "/rw" (
  	SET RUN_WIPERDOG="TRUE"
  )
  if "%%x" == "/wjm" (
  	SET WITH_JOB_MANAGER="TRUE"
  )
  if "%%x" == "/h" (
  	SET GET_WIPERDOG="TRUE"
  	call:usage
  )
)

if not exist quartz-2.2.1 (
  call %CUR_DIR%\checkoutQuartz.bat || GOTO HANDLE_FAIL
)

cd %CUR_DIR%

# GET WIPERDOG FROM MAVEN BY mvn COMMAND
if "%GET_WIPERDOG%" == "TRUE" (
  call %CUR_DIR%\getWiperdog.bat || GOTO HANDLE_FAIL
)

# INSTALL WIPERDOG
if "%INSTALL_WIPERDOG%" == "TRUE" (
  call %CUR_DIR%\installWiperdog.bat || GOTO HANDLE_FAIL
)

# INSTALL WIPERDOG WITHOUT JOB MANAGER
if "%WITH_JOB_MANAGER%" == "FALSE" (
  call %CUR_DIR%\configureWithoutJobManager.bat || GOTO HANDLE_FAIL
)

# INSTALL WIPERDOG WITH JOB MANAGER
if "%WITH_JOB_MANAGER%" = "TRUE" (
  call %CUR_DIR%\configureWithJobManager.bat || GOTO HANDLE_FAIL
)

# START WIPERDOG
if "%RUN_WIPERDOG%" = "TRUE" (
  call %CUR_DIR%\runWiperdog.bat
)
:HANDLE_FAIL