@echo off
rem **********************************************************
rem ***                                                    ***
rem ***                  mpy ... MultiPython               ***
rem ***                 ---------------------              ***
rem ***                                                    ***
rem ***     Find all Python versions and run arguments     ***
rem ***                                                    ***
rem **********************************************************

echo.
echo Where:
echo ========================================================
where py.exe
where python.exe
echo.
echo All versions:
echo ========================================================
py.exe -0
echo.

echo Where all versions and run script:
echo ========================================================

FOR /F %%v IN ('py.exe -0 2^>nul') DO (
	echo.
	echo %%v
	py.exe %%v -V
	py.exe %%v -c "import sys; print(sys.executable)"
	IF NOT "%1" == "" (
		py.exe %%v %*
		echo.
	)
    echo --------------------------------------------------------
)

echo.
