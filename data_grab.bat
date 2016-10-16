@echo off
REM Crafted and Coded by DamSimm
title DSIC Labs : System Data Grabber
color 9F
cls
:Menu
echo -
echo -
echo -
echo This Batch file will get the system information of this Computer
echo ----------------------------
echo [Choose which info you need]
echo [1 for Bios                ]
echo [2 for Motherboard         ]
echo [3 for CPU                 ]
echo [4 for Video Card          ]
echo [5 for Ram                 ]
echo [6 for OS                  ]
echo [7 for Disk Info           ]
echo [8 to Quit                 ]
echo [9 for Device Manager      ]
echo ----------------------------
CHOICE /C 123456789 /N /M "Choose one!"
Goto %ERRORLEVEL%

:1
echo ----------------------------
echo Getting BIOS Info
wmic bios get name,serialnumber,version
echo ----------------------------
pause
cls
GOTO Menu
:2
echo ----------------------------
echo Getting Motherboard Info
wmic baseboard get product,Manufacturer,version,serialnumber
echo ----------------------------
pause
cls
GOTO Menu
:3
echo ----------------------------
echo Getting CPU Info
wmic cpu get name,CurrentClockSpeed,MaxClockSpeed,Manufacturer
echo ----------------------------
pause
cls
GOTO Menu
:4
echo ----------------------------
echo Video Card Info
echo WARNING!
echo THIS WILL LAUNCH POWERSHELL
echo AND ABORT THIS BATCH FILE
echo ----------------------------
pause
cls
REM Only POWERSHELL can get detailed GPU info
REM DONOT ATTEMPT TO CIRCUMVENT 
powershell -Command Get-WmiObject Win32_Videocontroller
pause
:5
echo ----------------------------
echo RAM info
wmic MemoryChip get BankLabel, Capacity, MemoryType, TypeDetail, Speed
echo ----------------------------
pause
cls
GOTO Menu
:6
echo ----------------------------
echo OS Info
winver
echo ----------------------------
pause
cls
GOTO Menu
:7
echo ----------------------------
echo Disk Info
wmic logicaldisk 
diskmgmt.msc
echo For more info launch Disk Manager
echo ----------------------------
pause
cls
GOTO Menu
:8
pause

@echo on

:9
echo ----------------------------
echo Device Manager
devmgmt.msc
echo ----------------------------
pause
cls
GOTO Menu