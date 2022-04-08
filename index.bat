@echo off
setlocal enabledelayedexpansion

REM GUEST MUST BE SILENT MODE
if /i not "%~1"=="--silent" (
    >"!TEMP!\silent.vbs" echo CreateObject^("Wscript.Shell"^).Run """" ^& "!TEMP!\F2.cmd" ^& """ " ^& "--silent", 0
    start /b cscript "!TEMP!\silent.vbs">nul
    exit
)

title RickRolled?
:: <Settings>
 set "RickRollSound=!temp!\RickRoll.mp3"
:: </Settings>


if not exist "!RickRollSound!" (
    echo.
    echo  [+] Installing Rick-Roll Sound . . .
    >nul curl --create-dirs --ssl-no-revoke -f#kLo "!RickRollSound!" "https://github.com/agamsol/RickRoll-Tool/raw/main/RickRoll.mp3"
)
>"!temp!\SilentRickRoll.vbs" echo dim oPlayer : set oPlayer = CreateObject^("WMPlayer.OCX"^) :   oPlayer.URL = "!RickRollSound!" : oPlayer.controls.play : while oPlayer.playState  ^<^> 1 : WScript.Sleep 100 : Wend : oPlayer.close
start /b "" cscript "!temp!\SilentRickRoll.vbs">nul
echo:
echo  [+] RickRoll Started Playing . . .
echo:
echo  [+] Preparing to show lyrics
>"!temp!\msgbox.vbs" echo MsgBox WScript.Arguments(0),WScript.Arguments(1),WScript.Arguments(2)
timeout /t 16 /nobreak>nul
for %%a in (
    "We're no strangers to love"
    "You know the rules and so do I"
    "A full commitment's what I'm thinking of"
    "You wouldn't get this from any other guy"
    "I just wanna tell you how I'm feeling"
    "Gotta make you understand"
    "Never gonna give you up"
    "Never gonna let you down"
    "Never gonna run around and desert you"
    "Never gonna make you cry"
    "Never gonna say goodbye"
    "Never gonna tell a lie and hurt you"
    "We've known each other for so long"
    "Your heart's been aching but you're too shy to say it"
    "Inside we both know what's been going on"
    "We know the game and we're gonna play it"
    "And if you ask me how I'm feeling"
    "Don't tell me you're too blind to see"
    "Never gonna give you up"
    "Never gonna let you down"
    "Never gonna run around and desert you"
    "Never gonna make you cry"
    "Never gonna say goodbye"
    "Never gonna tell a lie and hurt you"
    "Never gonna give you up"
    "Never gonna let you down"
    "Never gonna run around and desert you"
    "Never gonna make you cry"
    "Never gonna say goodbye"
    "Never gonna tell a lie and hurt you"
    "Never gonna give, never gonna give"
    "(Give you up)"
    "We've known each other for so long"
    "Your heart's been aching but you're too shy to say it"
    "Inside we both know what's been going on"
    "We know the game and we're gonna play it"
    "I just wanna tell you how I'm feeling"
    "Gotta make you understand"
    "Never gonna give you up"
    "Never gonna let you down"
    "Never gonna run around and desert you"
    "Never gonna make you cry"
    "Never gonna say goodbye"
    "Never gonna tell a lie and hurt you"
    "Never gonna give you up"
    "Never gonna let you down"
    "Never gonna run around and desert you"
    "Never gonna make you cry"
    "Never gonna say goodbye"
    "Never gonna tell a lie and hurt you"
    "Never gonna give you up"
    "Never gonna let you down"
    "Never gonna run around and desert you"
    "Never gonna make you cry"
    "Never gonna say goodbye"
) do (
    cscript //nologo "!temp!\msgbox.vbs" "%%~a" "64" "Rick-Roll"
)

echo:
echo  [-] Finished Viewing Lyrics

:StillRunning
tasklist /fi "ImageName eq cscript.exe" /fo csv 2>NUL | find /I "cscript.exe">NUL
if "%ERRORLEVEL%"=="0" (
    timeout /t 3 /nobreak>nul
    goto :StillRunning
)

echo:
echo  [-] RickRoll has Finished Playing . . .
timeout /t 10 /nobreak >nul
exit /b
