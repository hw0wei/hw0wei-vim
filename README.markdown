

# [![Vim](http://www.vim.org/images/vim_editor.gif)](http://www.vim.org/) 
# _hw0wei-vim_ -> A highly optimized .vimrc config file

## Installation

On Windows and Linux Git and Curl are required. Also, if you haven't already, you'll need to install Vim.

### Install Vim,Gvim

*   Ubuntu  ->  sudo apt-get install vim-gtk
*   Fedora  ->  sudo yum install vim
*   Windows ->  [vim](https://bitbucket.org/Haroogan/vim-for-windows/downloads)

### Installing dependencies

#### Install [msysgit](http://code.google.com/p/msysgit/)

After installation try running `git --version` within _command prompt_ (press Win-R,  type `cmd`, press Enter) to make sure all good:

    C:\> git --version
    git version 1.9.0.msysgit.0

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

#### Setup [Ctags](http://ctags.sourceforge.net/)

Ctags generates an index (or tag) file of language objects found in source files that allows these items to be quickly and easily located by a text editor or other utility. I recommend you to use [Exuberant Ctags](http://ctags.sourceforge.net/).

#### Installing hw0wei-vim on windows

    > windows-install.cmd

#### Installing on Linux

    > sh bootstrap.sh

_in vim,run_

    > BundleIntall!      upgrade all plegins
    > BundleInstal       insstall newly added plugins
    > BundleClean        clean up inised plugins

## Plugin List
**Deps**

* [Vundle](https://github.com/gmarik/vundle)                            -> Manage the Vim scripts
* [Ack](https://github.com/mileszs/ack.vim)                             -> A replacement for 'grep' using Perl module App::Ack
* [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils) -> interpret a file by function and cache file automatically
* [tlib_vim](https://github.com/tomtom/tlib_vim)                        -> Some utility functions for VIM

**general**

* [nertree](https://github.com/scrooloose/nerdtree)                       -> Explore filesystem and to open files and directories
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)         -> NERDTree and tabs together in Vim, painlessly
* [vim-surround](https://github.com/tpope/vim-surround)                   -> quoting/parenthesizing made simple
* [delimitMate](https://github.com/Raimondi/delimitMate)                  -> provides insert mode auto-completion for quotes, parens, brackets
* [ctrlp](https://github.com/kien/ctrlp.vim)                              -> Full path fuzzy file, buffer, mru and tag finder with an intuitive interface
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) -> True Sublime Text style multiple selections for Vim
* [sessionman](https://github.com/vim-scripts/sessionman.vim)             -> Vim session manager
* [matchit](https://github.com/vim-scripts/matchit.zip)                   -> extended % matching for HTML, LaTeX, and many other languages
* [powerline](https://github.com/Lokaltog/vim-powerline)                  -> Create better-looking, more functional Vim statuslines
* [vim-airline](https://github.com/bling/vim-airline)                     -> statuslines
* [vim-bufferline](https://github.com/bling/vim-bufferline)               -> show the list of buffers in the command bar
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)            -> vim motion on speed!
* [csapprox](https://github.com/godlygeek/csapprox)                       -> Make gvim-only colorschemes work transparently in terminal vim
* [gundo](https://github.com/sjl/gundo.vim)                               -> Vim undo tree
* [vim-indent-guides](https://github.com/nathanae/vim-indent-guides)      -> Visually display indent levels in Vim
* [restore_view](https://github.com/vim-scripts/restore_view.vim)         -> automatically restoring file's cursor position and folding
* [golden-ratio](https://github.com/roman/golden-ratio)                   -> Resize windows automatically using the Golden Ratio

**Colorschemes**

* [solarized](https://github.com/altercation/vim-colors-solarized) -- `default`
* [seoul256](https://github.com/junegunn/seoul256.vim)
* [editplus](https://github.com/hw0wei/vim-colors-EditPlus)

**Generral Programming**

* [Syntastic](https://github.com/scrooloose/syntastic)         -> Syntax check that runs files through external syntax checkers
* [SingleCompile](https://github.com/xuhdev/SingleCompile)     -> Compile or run a single source file without leaving Vim
* [vim-fugitive](https://github.com/tpope/vim-fugitive)        -> Git wrapper
* [webapi-vim](https://github.com/mattn/webapi-vim.git)        -> Vim Interface to Web API
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter) -> Provide many different commenting operations and styles
* [tagbar](https://github.com/majutsushi/tagbar)               -> Browse the tags of source code files
* [numbers.vim](https://github.com/myusuf3/numbers.vim)        -> intelligently toggling line numbers

**Snippets & AutoComplete**

* [Youcompleteme](https://github.com/Valloric/YouCompleteMe)    -> A code-completion engine for Vim
* [ultisnips](https://github.com/SirVer/ultisnips)              -> The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
* [Neocomplcache](https://github.com/Shougo/neocomplcache)      -> Performs keyword completion by maintaining a cache of keywords
* [Neosbippet](https://github.com/Shougo/neosnippet)            -> small templates for commonly used code
* [vim_snippets](https://github.com/honza/vim-snippets)         -> This repository contains snippets files for various programming languages

**makrdown**

* [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc.git)                       -> vim bundle for pandoc users
* [vim-markdownfootnotes](https://github.com/vim-pandoc/vim-markdownfootnotes.git) -> Insert Extended Markdown Footnotes in Vim
* [vim-pandoc-preview](https://github.com/lambdalisue/vim-pandoc-preview.git)      -> Pandoc previewer for vimmer

**Misc**

* [VOoM](https://github.com/vim-scripts/VOoM)                                           -> Vim two-pane text outliner
* [vim-cucumber-align-pipes](https://github.com/quentindecock/vim-cucumber-align-pipes) -> Align pipes when you are editing Cucumber tables
* [Puppet-Syntax-Highlighting](https://github.com/puppetlabs/puppet-syntax-vim)         -> Puppet language syntax highlighting for Vim
* [calendar.vim](https://github.com/itchyny/calendar.vim)                               -> A calendar application for Vim
