:: Remove all files and folders from Downloads folder
del /q "%userprofile%\Downloads\*"
for /d %%p in ("%userprofile%\Downloads\*") do rmdir "%%p" /s /q

:: Remove all files and folders from Desktop
del /q "%userprofile%\Desktop\*"
for /d %%p in ("%userprofile%\Desktop\*") do rmdir "%%p" /s /q

:: Remove all files and folders from Recycle Bin
rmdir /s /q "C:\$Recycle.Bin"

:: Remove Roblox
rmdir /s /q "%localappdata%\Roblox"
rmdir /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Roblox"

:: Remove Google Chrome user data
rmdir /s /q "%localappdata%\Google\Chrome\User Data"
