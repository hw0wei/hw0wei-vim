@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR=%HOME%\.hw0wei-vim
IF NOT EXIST "%BASE_DIR%" (
  call git clone --recursive https://github.com/hw0wei/hw0wei-vim.git "%BASE_DIR%"
    ) ELSE (
    @set ORIGINAL_DIR=%CD%
    echo updating hw0wei
    chdir /d "%BASE_DIR%" 
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%BASE_DIR%" 
    )

call mklink "%HOME%\.vimrc" "%BASE_DIR%\vimrc"
call mklink /J "%HOME%\.vim" "%BASE_DIR%\.vim"

IF NOT EXIST "%BASE_DIR%\.vim\bundle" (
    call mkdir "%BASE_DIR%\.vim\bundle"
    )

IF NOT EXIST "%HOME%/.vim/bundle/vundle" (
    call git clone https://github.com/gmarik/vundle.git "%HOME%/.vim/bundle/vundle"
    )

IF NOt exist "%HOME%/.vim/bundle/vim-colors-solarized" (
        call git clone git://github.com/altercation/vim-colors-solarized.git "%HOME%"/.vim/bundle/vim-colors-solarized
        )

call gvim -u "%BASE_DIR%\vimrc" +BundleInstall! +BundleClean +qall
