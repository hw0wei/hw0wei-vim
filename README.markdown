## Install Vim,Gvim

*   Ubuntu -> sudo apt-get install vim-gtk
*   Fedora -> sudo yum install vim
*   Win7-64bit ->  [vim](https://bitbucket.org/Haroogan/vim-for-windows/downloads)

## Installing on Windows

On Windows and \*nix Git and Curl are required. Also, if you haven't already, you'll need to install Vim.

### Installing dependencies

#### Install [msysgit](http://code.google.com/p/msysgit/)

After installation try running `git --version` within _command prompt_ (press Win-R,  type `cmd`, press Enter) to make sure all good:

    C:\> git --version
    git version 1.7.4.msysgit.0

#### Setup [Curl](http://curl.haxx.se/)
_Instructions blatently copied from vundle readme_
Installing Curl on Windows is easy as [Curl](http://curl.haxx.se/) is bundled with [msysgit](http://code.google.com/p/msysgit/)!
But before it can be used with [Vundle](https://github.com/gmarik/vundle) it's required make `curl` run in _command prompt_.
The easiest way is to create `curl.cmd` with [this content](https://gist.github.com/912993)

    @rem Do not use "echo off" to not affect any child calls.
    @setlocal

    @rem Get the abolute path to the parent directory, which is assumed to be the
    @rem Git installation root.
    @for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
    @set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

    @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
    @if not exist "%HOME%" @set HOME=%USERPROFILE%

    @curl.exe %*

And copy it to `C:\Program Files\Git\cmd\curl.cmd`, assuming msysgit was installed to `c:\Program Files\Git`

to verify all good, run:

    C:\> curl --version
    curl 7.21.1 (i686-pc-mingw32) libcurl/7.21.1 OpenSSL/0.9.8k zlib/1.2.3
    Protocols: dict file ftp ftps http https imap imaps ldap ldaps pop3 pop3s rtsp smtp smtps telnet tftp
    Features: Largefile NTLM SSL SSPI libz
#### instll hw0wei-vim on windows

    > windows-install.cmd

## Installing on Linux

    > sh bootstrap.sh

_in vim,run_

    > BundleIntall!      upgrade all plegins
    > BundleInstal       insstall newly added plugins
    > BundleClean        clean up inised plugins

## Plugin List

*   [Vundle](https://github.com/gmarik/vundle) -> Manage the Vim scripts
*   [NERD_tree](https://github.com/scrooloose/nerdtree) -> Explore filesystem and to open files and directories
*   [NERD_commenter](https://github.com/scrooloose/nerdcommenter) -> Provide many different commenting operations and styles
*   [Gundo](https://github.com/sjl/gundo.vim) -> Visualize Vim undo tree
*   [Tagbar](https://github.com/majutsushi/tagbar) -> Browse the tags of source code files
*   [Powerline](https://github.com/Lokaltog/vim-powerline) -> Create better-looking, more functional Vim statuslines
*   [Indent Guides](https://github.com/nathanae/vim-indent-guides) -> Visually display indent levels in Vim
*   [Golden Ratio](https://github.com/roman/golden-ratio) -> Resize windows automatically using the Golden Ratio
*   [Ctrlp](https://github.com/kien/ctrlp.vim) -> Full path fuzzy file, buffer, mru and tag finder with an intuitive interface
*   [Ack](https://github.com/mileszs/ack.vim) -> A replacement for 'grep' using Perl module App::Ack
*   [delimitMate](https://github.com/Raimondi/delimitMate) -> Provides automatic closing of quotes, parenthesis, brackets, etc.
*   [numbers](https://github.com/myusuf3/numbers.vim) -> A plugin for intelligently toggling line numbers
*   [surround](https://github.com/tpope/vim-surround) -> Provide mappings to delete, change and add surroundings in pairs
*   [VOoM](https://github.com/vim-scripts/VOoM) -> Vim two-pane text outliner
*   [fugitive](https://github.com/tpope/vim-fugitive) -> Git wrapper
*   [tabular](https://github.com/godlygeek/tabular) -> Vim script for text filtering and alignment
*   [Neocomplcache](https://github.com/Shougo/neocomplcache) -> Performs keyword completion by maintaining a cache of keywords
*   [Neosbippet](https://github.com/Shougo/neosnippet) -> small templates for commonly used code
*   [vim_snippets](https://github.com/honza/vim-snippets) -> This repository contains snippets files for various programming languages
*   [Syntastic](https://github.com/scrooloose/syntastic) -> Syntax check that runs files through external syntax checkers
*   [SingleCompile](https://github.com/xuhdev/SingleCompile) -> Compile or run a single source file without leaving Vim
*   [speeddating](https://github.com/tpope/vim-speeddating) -> Use CTRL-A/CTRL-X to increment dates, times, and more
*   [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc.git) -> vim bundle for pandoc users
*   [vim-pandoc-extras](https://github.com/vim-pandoc/vim-pandoc-extras.git) -> extra utilities to be used along vim-pandoc
*   [vim-markdownfootnotes](https://github.com/vim-pandoc/vim-markdownfootnotes.git) -> Insert Extended Markdown Footnotes in Vim
*   [vim-pandoc-preview](https://github.com/lambdalisue/vim-pandoc-preview.git)-> Pandoc previewer for vimmer
*   [webapi](https://github.com/mattn/webapi-vim.git) -> Vim Interface to Web API

## Themes List

*   [solarized](https://github.com/altercation/vim-colors-solarized) -- `default`
