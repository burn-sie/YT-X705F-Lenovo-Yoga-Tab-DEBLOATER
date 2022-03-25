@echo off
cls
@echo Do you want to remove bloat from "Lenovo Smart Tab with Google" aka "YT-X705F" ?
set /p prompt=Are You Sure?[Y/N]: 
if %prompt%== Y goto CONTINUE
if not %prompt%== Y exit

:CONTINUE
@echo You must grant adb SuperUser permissions on your tablet in order for this script to work.
TIMEOUT /T 5
echo.
cls

@echo Sending Super User request. Please Press Grant on the tablet then 

:: The following line unmounts the system partition and remounts it as writable.
adb shell su -c mount --remount / -w

echo.

cls
::Another Prompt
set /P surequest=Did you press the grant button on the tablet?[Y/N]:
if %surequest%== Y goto DELETE
if not %surequest%== Y exit



:DELETE
@echo Deleting.... DONT CLOSE THE WINDOW!!
@echo off
:: The following line unmounts the system and vendor partition and remounts it as writable.
adb shell su -c mount --remount / -w
adb shell su -c mount --remount /vendor -w

::The Following starts deleting things aka bloat. Breaks multi user though.
adb shell su -c rm -frR /system/app/Outlook/
adb shell su -c rm -frR /system/app/YandexSearch/
adb shell su -c rm -frR /system/app/YandexBrowser/
adb shell su -c rm -frR /system/product/app/Photos/
adb shell su -c rm -frR /system/app/MonsterClass/
adb shell su -c rm -frR /system/app/Skype/
adb shell su -c rm -frR /system/product/app/YouTube/
adb shell su -c rm -frR /system/app/Outlook/
adb shell su -c rm -frR /system/priv-app/Epos_Yoga/
adb shell su -c rm -frR /system/product/app/Drive/
adb shell su -c rm -frR /system/app/Tips/
adb shell su -c rm -frR /system/product/app/Duo/
adb shell su -c rm -frR /system/priv-app/Faskaren/
adb shell su -c rm -frR /system/app/Midtest/
adb shell su -c rm -frR /system/product/app/Gmail2/
adb shell su -c rm -frR /system/product/app/Videos/
adb shell su -c rm -frR /system/product/app/CalendarGoogle/
adb shell su -c rm -frR /system/priv-app/LenovoWeather/
adb shell su -c rm -frR /system/product/app/Chrome/
adb shell su -c rm -frR /system/product/app/Keep/
adb shell su -c rm -frR /system/product/priv-app/FilesGoogle/
adb shell su -c rm -frR /system/app/GoogleNews/
adb shell su -c rm -frR /system/app/Music2/
adb shell su -c rm -frR /system/product/priv-app/Contacts/
adb shell su -c rm -frR /system/priv-app/LenovoWhatsNewClient/
adb shell su -c rm -frR /system/priv-app/Podcasts/
adb shell su -c rm -frR /system/priv-app/KidCtrl/
adb shell su -c rm -frR /system/app/FT_Terminal_Test/
adb shell su -c rm -frR /system/priv-app/MultiUserSetting_ROW/
adb shell su -c rm -frR /vendor/app/LenovoRUStub/
adb shell su -c rm -frR /vendor/operator/app/AudioBook/
adb shell su -c rm -frR /system/app/LenovoUserExperience_ROW/
adb shell su -c rm -frR /system/priv-app/Theme_3.3.20LE/
adb shell su -c rm -frR /system/priv-app/LSF_DeviceService/
adb shell su -c rm -frR /system/priv-app/OCZ_ClientDownloader/
adb shell su -c rm -frR /system/priv-app/OCZ_DeployServiceApp/
adb shell su -c rm -frR /system/priv-app/StatementService/



cls
adb reboot
@echo Tablet restarted, if you ran this script on a fresh reset, the bloat should be gone. 
@echo If you didnt reset, you can now uninstall bloat apps normally.
TIMEOUT /T 10
exit
