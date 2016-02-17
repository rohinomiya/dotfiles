rem notice: execute as administrator

rapidee -A -C -E HOME "%USERPROFILE%"
rapidee -A -C -E DropboxDir "%USERPROFILE%\Dropbox"
rapidee -A -C -E GOPATH "%DropboxDir%"
rapidee -A -C -E GOROOT "C:\Go"
rapidee -A -C -E PATH "C:\Program Files\Git\bin"
rapidee -A -C -E PATH "C:\Program Files\7-Zip"
rapidee -A -C -E PATH "%GOPATH%\bin"
rapidee -A -C -E PATH "%GOPATH%\bin\gibo"
rapidee -A -C -E PATH "C:\MinGW\bin"
rapidee -A -C -E TEMP "T:\temp"
rapidee -A -C -E TMP  "T:\temp"
rapidee -A -C -E EDITOR "%DropboxDir%\bin\vim\gvim.exe"

pause
