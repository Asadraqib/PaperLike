@echo off
setlocal
set "APP_HOME=%~dp0"
set "WRAPPER_JAR=%APP_HOME%gradle\wrapper\gradle-wrapper.jar"
if not exist "%WRAPPER_JAR%" (
  powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%APP_HOME%gradle\wrapper\bootstrap-wrapper.ps1"
  if errorlevel 1 exit /b 1
)
if defined JAVA_HOME (
  set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
) else (
  set "JAVA_EXE=java.exe"
)
if not exist "%JAVA_EXE%" (
  if exist "%ProgramFiles%\Android\Android Studio\jbr\bin\java.exe" set "JAVA_EXE=%ProgramFiles%\Android\Android Studio\jbr\bin\java.exe"
)
"%JAVA_EXE%" -cp "%WRAPPER_JAR%" org.gradle.wrapper.GradleWrapperMain %*
set "RESULT=%ERRORLEVEL%"
endlocal & exit /b %RESULT%
