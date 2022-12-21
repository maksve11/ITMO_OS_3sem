:copylf
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 copy @path %~dp0temp /Z /Y"
EXIT /B 0


:while
    if %ERRORLEVEL% neq 0 (
        call :copylf & exit /b,
        goto :while
    )