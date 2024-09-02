@echo off
cls
@echo Do you want to remove bloat from "Lenovo Smart Tab with Google" aka "YT-X705F" ?
@echo This script will break LenovoID and the factory reset button in Settings.
set /p prompt=Are You Sure?[Y/N]: 
if %prompt%== Y goto CONTINUE
if %prompt%== y goto CONTINUE
if not %prompt%== Y exit
exit

:CONTINUE
@echo You must grant adb SuperUser permissions on your tablet in order for this script to work.
TIMEOUT /T 5
echo.
cls

:SENDSU
@echo Sending Super User request. Please Press Grant on the tablet then 
adb shell su -c mount --remount / -w
echo.
cls
set /P surequest=Did you press the grant button on the tablet?[Y/N]:
if %surequest%== Y goto DELETE
if %surequest%== y goto DELETE
if not %surequest%== Y goto SENDSU
exit

:DELETE
@echo Deleting.... DONT CLOSE THE WINDOW!!
@echo off
adb shell su -c mount --remount / -w
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

adb shell su -c rm -frR /system/priv-app/LenovoOTA/
adb shell su -c rm -frR /system/priv-app/LSF_LenovoID/
adb shell su -c rm -frR /system/priv-app/LSF_DeviceService/
adb shell su -c rm -frR /system/priv-app/OCZ_ClientDownloader/
adb shell su -c rm -frR /system/priv-app/OCZ_DeployServiceApp/
adb shell su -c rm -frR /system/priv-app/SetupWizardExt_ROW/
adb shell su -c rm -frR /system/priv-app/LenovoWallpaper/
adb shell su -c rm -frR /system/app/Traceur/
adb shell su -c rm -frR /system/app/Midtest/
adb shell su -c rm -frR /system/app/ExactCalculator/
adb shell su -c rm -frR /vendor/app/LenovoRUStub/
adb shell su -c rm -frR /vendor/app/SSGTelemetryService/
adb shell su -c rm -frR /vendor/operator/app/AudioBook/
adb shell su -c pm uninstall --user 0 com.lct.lottie

adb shell su -c rm -frR /system/priv-app/Theme_3.3.20LE/
adb shell su -c rm -frR /system/app/FT_Terminal_Test/
adb shell su -c rm -frR /system/app/googleassistant_35_alldpi_minSdk21_releasekey/
adb shell su -c rm -frR /system/app/LenovoUserExperience_ROW/
adb shell su -c rm -frR /system/product/priv-app/HotwordEnrollmentXGoogleTL3210/
adb shell su -c rm -frR /system/product/priv-app/HotwordEnrollmentOKGoogleTL3210/
adb shell su -c rm -frR /data/app/com.google.android.googlequicksearchbox-JtzA2bvJ3OPya6BxcPFuzQ==/

adb reboot
@echo Tablet restarted, if you ran this script on a fresh reset, the bloat should be gone. 
@echo If you didnt reset, you can now uninstall bloat apps normally.

@echo To Factory Reset your device, run "fastboot -w" from you computer while in fastboot.


TIMEOUT /T 30

exit
