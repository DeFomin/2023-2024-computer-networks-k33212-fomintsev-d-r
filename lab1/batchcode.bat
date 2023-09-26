@echo off
setlocal enabledelayedexpansion
set /p choice=Select configuration mode (1: DHCP, 2: Manual): 
echo Available network connections
netsh interface show interface
set /p local=Enter your local area connection ("Wireless"): 

if "%choice%"=="1" (
    echo You've choosen DHCP.
    netsh interface ip set addres %local% dhcp
    netsh interface ip set dns %local% dhcp
) else if "%choice%"=="2" (
    echo You've choosen Manual.

    set /p ip=Enter IP adress:
    set /p mask=Enter subnet mask:
    set /p gateway=Enter default gateway:
    set /p dns=Enter DNS server adress:

    netsh interface ip set address name=%local% static address="!ip!" mask="!mask!" gateway="!gateway!" 
    netsh interface ip set dns name=%local% static "!dns!" validate=no
) else (
    echo Please select 1 or 2.
)
pause
