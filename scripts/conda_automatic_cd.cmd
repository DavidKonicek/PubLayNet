@echo off

where conda >nul 2>nul
if not %errorlevel% == 0 goto noconda

if "%CONDA_PREFIX%" == "C:\ProgramData\anaconda3" goto no_env

if not exist .gitignore cd ..

md %CONDA_PREFIX%\etc\conda\activate.d
echo cd /d %CD% >%CONDA_PREFIX%\etc\conda\activate.d\change_directory.bat 
echo Set-Location -Path %CD% >%CONDA_PREFIX%\etc\conda\activate.d\change_directory.ps1
echo cd %CD% >%CONDA_PREFIX%\etc\conda\activate.d\change_directory.sh

exit /b

:help
@echo off
echo .
echo Sets Conda environment for Python to automatically change folder when activated
echo .
echo Usage: %0
echo .
exit /b

:noconda
@echo off
echo .
echo No Anaconda found. Run this script using Anaconda CMD link.
echo .
exit /b

:no_env
@echo off
echo .
echo No activated Anaconda environment. Activate environment and rerun this script.
echo .
exit /b
