@echo off
SET CUR_DIR=%~dp0
echo "I will proceed special request for Quartz and terracotta bundle"
cd demoTerracottaBundle
call mvn clean install
if not exist %CUR_DIR%..\lib\java\bundle (
	mkdir %CUR_DIR%..\lib\java\bundle
)
copy target\terracottaInMavenBundle-1.0.jar %CUR_DIR%..\lib\java\bundle\terracottaInMavenBundle-1.0.jar
cd %CUR_DIR%
if not exist quartz-2.2.1 (
	call checkoutAndInstallQuartz.bat
)
copy quartz-2.2.1\target\quartz-2.2.1.jar %CUR_DIR%..\lib\java\bundle\quartz-2.2.1.jar
