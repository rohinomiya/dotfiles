rem make symbolic/hard links

cd "%USERPROFILE%"
mklink /D .peco"      "%USERPROFILE%\Dropbox\dotfiles\.peco"
mklink /D .ssh"       "%USERPROFILE%\Dropbox\dotfiles\.ssh"
mklink /D .unite"     "%USERPROFILE%\Dropbox\dotfiles\.unite"
mklink /D .vim"       "%USERPROFILE%\Dropbox\dotfiles\.vim"
mklink /H .gitignore" "%USERPROFILE%\Dropbox\dotfiles\.gitignore"
mklink /H .gitconfig" "%USERPROFILE%\Dropbox\dotfiles\.gitconfig"
mklink /H .nyagos"    "%USERPROFILE%\Dropbox\dotfiles\.nyagos"
mklink /H .peco-cd"   "%USERPROFILE%\Dropbox\dotfiles\.peco-cd"
mklink /H .snippets"  "%USERPROFILE%\Dropbox\dotfiles\.snippets"
mklink /H _vimrc"     "%USERPROFILE%\Dropbox\dotfiles\_vimrc"
mklink /H _gvimrc"    "%USERPROFILE%\Dropbox\dotfiles\_gvimrc"

pause
