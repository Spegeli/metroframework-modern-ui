@echo off

set config=Release
set outputdir=C:\Users\Andreas\Dropbox\VisualStudio\DLLs\Themes\MetroFramework\build
set cwd=%CD%
set commonflags=/p:Configuration=%config%;AllowUnsafeBlocks=true /p:CLSCompliant=False

if %PROCESSOR_ARCHITECTURE%==x86 (
         set msbuild="%WINDIR%\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
) else ( set msbuild="%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe"
)

:build
echo ---------------------------------------------------------------------
echo Building AnyCpu release...
%msbuild% "%inputdir%\MetroFramework.sln" %commonflags% /tv:3.5 /p:TargetFrameworkVersion=v2.0 /p:Platform="Any Cpu" /p:OutputPath="%outputdir%\AnyCpu\NET20"
if errorlevel 1 goto build-error
%msbuild% "%inputdir%\MetroFramework.sln" %commonflags% /tv:3.5 /p:TargetFrameworkVersion=v3.5 /p:Platform="Any Cpu" /p:OutputPath="%outputdir%\AnyCpu\NET35"
if errorlevel 1 goto build-error
%msbuild% "%inputdir%\MetroFramework.sln" %commonflags% /tv:4.0 /p:TargetFrameworkVersion=v4.0 /p:Platform="Any Cpu" /p:OutputPath="%outputdir%\AnyCpu\NET40"
if errorlevel 1 goto build-error
%msbuild% "%inputdir%\MetroFramework.sln" %commonflags% /tv:4.0 /p:TargetFrameworkVersion=v4.5 /p:Platform="Any Cpu" /p:OutputPath="%outputdir%\AnyCpu\NET45"
if errorlevel 1 goto build-error




MetroFramework\MetroFramework.csproj

:build-error
echo Failed to compile...
pause

:done
echo.
echo ---------------------------------------------------------------------
echo Compile finished....
cd %cwd%
pause