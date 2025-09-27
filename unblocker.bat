@ECHO OFF
ECHO Включение редактора реестра...

REM Устанавливаем параметр DisableRegistryTools в 0
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 0 /f

IF %ERRORLEVEL%==0 (
    ECHO Редактор реестра успешно включен.
) ELSE (
    ECHO Ошибка при включении. Убедитесь, что у вас есть права администратора.
)

PAUSE
