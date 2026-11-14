@echo off
setlocal
cd /d "%~dp0"
echo.
echo ==== Publishing your portfolio site ====
echo.
echo Step 1 of 3: Building the site (this can take a minute)...
call quarto render
if errorlevel 1 goto buildfail

echo.
echo Step 2 of 3: Checking for changes...
git add -A
git diff --cached --quiet
if not errorlevel 1 goto nochanges

echo.
set "msg="
set /p msg=Briefly describe what you changed (or press Enter to skip): 
if not defined msg set "msg=Update site"
set "msg=%msg:"=%"
if "%msg%"=="" set "msg=Update site"

echo.
echo Step 3 of 3: Uploading your changes...
git commit -m "%msg%"
if errorlevel 1 goto commitfail
git push
if errorlevel 1 goto pushfail

echo.
echo Published! Your site will update at https://uu14-cmyk.github.io in 1-2 minutes.
echo.
pause
exit /b 0

:buildfail
echo.
echo Build failed - see messages above. Nothing was published.
echo.
pause
exit /b 1

:nochanges
echo.
echo No changes to publish.
echo.
pause
exit /b 0

:commitfail
echo.
echo Could not save your changes (commit failed) - see messages above. Nothing was published.
echo.
pause
exit /b 1

:pushfail
echo.
echo Your changes were saved on this computer but could not be uploaded - see messages above.
echo Check your internet connection or GitHub sign-in, then double-click publish.bat again.
echo.
pause
exit /b 1
