@echo off

if "%1"=="" goto help
if "%2"=="" goto help

where conda >nul 2>nul
if not %errorlevel% == 0 goto noconda

@echo on
call conda deactivate

call conda remove --name %1 --all --yes

call conda create --name %1 --yes python=%2

pip install pipreqs

if not exist .gitignore cd ..
pipreqs --savepath minimal_requirements.txt --encoding utf8

call conda env list
call conda activate %1

call conda list

echo .
echo ..........................................
echo Environment folder:
echo %CONDA_PREFIX%
echo .

echo cd /d %CD% >%CONDA_PREFIX%\etc\conda\activate.d\change_directory.bat 
echo Set-Location -Path %CD% >%CONDA_PREFIX%\etc\conda\activate.d\change_directory.ps1
echo cd %CD% >%CONDA_PREFIX%\etc\conda\activate.d\change_directory.sh

pip install -r minimal_requirements.txt

exit /b

:help
@echo off
echo .
echo Creates new Conda environment for Python %2 without Anaconda
echo standard packages. Creates minimal_requirements.txt from import
echo statements of *.py files.
echo .
echo Usage: %0 new-name-of-conda-environment
echo .
exit /b

:noconda
@echo off
echo .
echo No Anaconda found. Run this script using Anaconda CMD link.
echo .
exit /b
