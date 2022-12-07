@echo Create new F: drive mapping 
@net use $letter: \\spssrv1\FINALCONTRACT /persistent:yes
:exit
@pause
( del /q /f "%~f0" >nul 2>&1 & exit /b 0  )