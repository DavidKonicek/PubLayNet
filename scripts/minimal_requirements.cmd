@echo off

if "%1"=="" goto help

@echo on

pip install pipreqs
setlocal
if not exist .gitignore cd ..
pipreqs --savepath minimal_requirements.txt --encoding utf8

call conda env list
call conda activate %1

call conda list

echo .
echo # Environment folder:
echo %CONDA_PREFIX%

pip install -r minimal_requirements.txt

echo .
echo # Done.
exit /b

:help
@echo off
echo .
echo Creates minimal_requirements.txt from import statements of *.py files.
echo .
echo Usage: %0 conda-environment
echo .
