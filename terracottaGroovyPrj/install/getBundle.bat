@echo off
if "%3"=="" (
	mvn dependency:get -Dartifact=%1 -Ddest=%2
) else (
	mvn dependency:get -Dartifact=%1 -Ddest=%2 -DrepoUrl=%3
)