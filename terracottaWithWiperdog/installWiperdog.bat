@echo off
cls
set CUR_DIR=%CD%
set errorLevel=0
call java -version || set errorLevel=1
if %errorLevel% == 1 (
	echo "Could not find java.\n Please install JDK 1.6 and continue!"
	EXIT /B 1
)
echo Start installing wiperdog in silent mode
java -jar wiperdog-assembly.jar -d %CUR_DIR%\wiperdog -j 13111 -m "localhost" -p 27017 -n "wiperdog" -mp "" -s no