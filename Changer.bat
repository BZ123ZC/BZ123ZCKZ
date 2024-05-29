@echo off
setlocal enabledelayedexpansion

REM Generate random IP address
set /a "ip1=%RANDOM% %% 256"
set /a "ip2=%RANDOM% %% 256"
set /a "ip3=%RANDOM% %% 256"
set /a "ip4=%RANDOM% %% 254 + 1"
set new_ip=!ip1!.!ip2!.!ip3!.!ip4!

REM Turn off the network interface
netsh interface set interface "Ethernet" admin=disabled

REM Set the IP address
netsh interface ipv4 set address "Ethernet" static !new_ip!

REM Enable DHCP
netsh interface ipv4 set address "Ethernet" dhcp

REM Turn on the network interface
netsh interface set interface "Ethernet" admin=enabled

echo IP address changed to !new_ip! and DHCP enabled.
pause
