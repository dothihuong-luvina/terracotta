@echo off
setlocal EnableDelayedExpansion
SET INSTALL_DIR="%CD%"

if not exist quartz-2.2.1 (
  set errorLevel=0
  call svn --version >nul 2>&1 || set errorLevel=1
  if !errorLevel! == 1 (
    echo SVN not found, please install
    EXIT /B 1
  )
  echo Check out Quartz...
  svn checkout http://svn.terracotta.org/svn/quartz/tags/quartz-2.2.1/quartz/ quartz-2.2.1
  xcopy "%INSTALL_DIR%\quartz\pom.xml" "%INSTALL_DIR%\quartz-2.2.1" /Y
)

if not exist quartz-2.2.1/target/quartz-2.2.1.jar (
  set errorLevel=0
  call mvn -v  >nul 2>&1 || set errorLevel=1
  if !errorLevel! == 1 (
    echo MAVEN not found, please install
    EXIT /B 1
  )
  cd "%INSTALL_DIR%\quartz-2.2.1"
  call mvn install || set errorLevel=1
  if !errorLevel! == 1 (
    echo ==============================================================
    echo There are error in maven building! Maybe dependencies errors. 
	echo Please checkout and build ehcache, quartz, terracotta.
    echo For help. Please refer to https://github.com/dothihuong-luvina/terracotta.git terracotta_lib_and_server
    EXIT /B 1
  )
)
endlocal