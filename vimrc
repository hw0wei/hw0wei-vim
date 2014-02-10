"---------------------------------modeline--------------------------------------------
" vim:fdm=marker:fmr=[[[,]]]:
" vim:foldtext=getline(v\:foldstart).'\ \ \ /'.v\:foldlevel.'...'.(v\:foldend-v\:foldstart)
"---------------------------------modeline--------------------------------------------
" vimrc      Vimrc -- Vim configuring
"
" Author        : Wei-Huang (hw0wei) <hw0wei@163.com>
" Created       : 2013-03-13
" Last Modified : 2014-02-04
" Verion        : 2.0.0
"--------------------------------------------------------------------------------------

" Overview [[[1~
"
" hw0wei-vim - A highly optimized vimrc config file
"
" Structure:
"
"   -> Environment
"       => Identify platform
"       => Basics
"       => Windows Compatible
"   -> Bundle
"       => Setup Bundle Support
"       => Deps
"       => General
"       => General Programming
"       => Colorschemes
"       => Python
"       => HTML
"       => Markdown
"       => Misc
"   -> Vim_configuration
"       => General
"       => Vim UI
"       => GUI Settings
"       => Formatting
"       => Search Related
"       => Fold Related
"       => Key Mapping
"       => Local Setting
"   -> Plugin_configuration
"       => misc
"       => OmniComplete
"       => ctags
"       => AutoCloseTag
"       => SnipMate
"       => NERDTree
"       => Tabularize
"       => Session List
"       => JSON
"       => PyMode
"       => CtrlP
"       => TagBar
"       => PythonMode
"       => Fugitive
"       => neocomplete
"       => neocomplcache
"       => Normal Vim-completion
"       => Snippets
"       => Gundo
"       => Golden-ratio
"       => Voom
"       => number
"       => Syntastic
"       => SingleCompile
"       => indent_guides
"       => vim-airline
"   ->Options:

" ]]]

" Environment_Configuration: [[[1~

    " Identify platform [[[2
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " ]]]

    " Basics [[[2
       " Must be first line
        set nocompatible        " Get out of VI's compatible mode
        set background=dark     " Assume a dark background
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " ]]]

    " Windows Compatible [[[2
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " ]]]

" ]]]

" Bundle_Configuration: [[[1~

    " Setup Bundle Support [[[2
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " ]]]

    " Deps [[[2
        " Let Vundle manage Vundle
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        if executable('ag')
            Bundle 'mileszs/ack.vim'
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
        elseif executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        endif
    " ]]]

    " list only the plugin groups you will use
    if !exists('g:hw0wei_bundle_groups')
        let g:hw0wei_bundle_groups=['general', 'colorschemes', 'neocomplcache', 'programming', 'python', 'markdown', 'misc']
    endif

    " General [[[2
    if count(g:hw0wei_bundle_groups, 'general')
        Bundle 'scrooloose/nerdtree'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'tpope/vim-surround'
        Bundle 'spf13/vim-autoclose'
        Bundle 'kien/ctrlp.vim'
        Bundle 'terryma/vim-multiple-cursors'
        Bundle 'vim-scripts/sessionman.vim'
        Bundle 'matchit.zip'
        if has("python") || has("python3")
            Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
            let airline=0
        else
            Bundle 'bling/vim-airline'
            let airline=1
            endif
        Bundle 'bling/vim-bufferline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'godlygeek/csapprox'
        if executable('python')
            Bundle 'sjl/gundo.vim'
        endif
        Bundle 'nathanaelkane/vim-indent-guides'
        if !exists('g:hw0wei_no_views')
            Bundle 'vim-scripts/restore_view.vim'
        endif
        Bundle 'mhinz/vim-signify'
        Bundle 'tpope/vim-abolish.git'
        Bundle 'osyo-manga/vim-over'
        Bundle 'justinmk/vim-sneak'
        Bundle 'roman/golden-ratio'
     endif
    " ]]]

    " Colorschemes [[[2
    if count(g:hw0wei_bundle_groups,'colorschemes')
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'hw0wei/vim-colors-EditPlus'
        Bundle 'junegunn/seoul256.vim'
    endif
    " ]]]

    " General Programming [[[2
        if count(g:hw0wei_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            Bundle 'scrooloose/syntastic'
            Bundle 'xuhdev/SingleCompile'
            Bundle 'tpope/vim-fugitive'
            Bundle 'mattn/webapi-vim'
            Bundle 'mattn/gist-vim'
            Bundle 'scrooloose/nerdcommenter'
            Bundle 'godlygeek/tabular'
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
            endif
            Bundle 'myusuf3/numbers.vim'
        endif
    " ]]]

    " Snippets & AutoComplete [[[2
        if count(g:hw0wei_bundle_groups, 'snipmate')
            Bundle 'garbas/vim-snipmate'
            Bundle 'honza/vim-snippets'
            " Source support_function.vim to support vim-snippets.
            if filereadable(expand("~/.vim/bundle/vim-snippets/snippets/support_functions.vim"))
                source ~/.vim/bundle/vim-snippets/snippets/support_functions.vim
            endif
        elseif count    (g:hw0wei_bundle_groups, 'youcompleteme')
            Bundle 'Valloric/YouCompleteMe'
            Bundle 'SirVer/ultisnips'
        elseif count    (g:hw0wei_bundle_groups, 'neocomplcache')
            Bundle 'Shougo/neocomplcache'
            Bundle 'Shougo/neosnippet'
            Bundle 'honza/vim-snippets'
        elseif count    (g:hw0wei_bundle_groups, 'neocomplete')
            Bundle 'Shougo/neocomplete.vim.git'
            Bundle 'Shougo/neosnippet'
            Bundle 'honza/vim-snippets'
        endif
    " ]]]

    " Python [[[2
        if count(g:hw0wei_bundle_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            Bundle 'klen/python-mode'
            Bundle 'python.vim'
            Bundle 'python_match.vim'
            Bundle 'pythoncomplete'
        endif
    " ]]]

    " Markdown [[[2
    	if count(g:hw0wei_bundle_groups, 'markdown')
        	Bundle 'vim-pandoc/vim-pandoc'
        	Bundle 'vim-pandoc/vim-markdownfootnotes'
        	Bundle 'lambdalisue/vim-pandoc-preview'
      endif
    " ]]]

    " Misc [[[2
        if count(g:hw0wei_bundle_groups, 'misc')
            Bundle 'vim-scripts/VOoM'
            Bundle 'tpope/vim-cucumber'
            Bundle 'quentindecock/vim-cucumber-align-pipes'
            Bundle 'Puppet-Syntax-Highlighting'
            Bundle 'itchyny/calendar.vim'
        endif
    " ]]]

" ]]]

" Vim_Configuration: [[[1~

    " General [[[2
    filetype plugin indent on " Automatically detect file types.
    let mapleader=',' " Change the mapleader
    let maplocalleader='\' " Change the maplocalleader
    set timeoutlen=500 " Time to wait for a command

    " Source the vimrc file after saving it
    autocmd BufWritePost vimrc source $MYVIMRC
    " Fast edit the .vimrc file using ',x'
    nnoremap <Leader>x :tabedit $MYVIMRC<CR>

    if !has('gui')
        set term=$TERM          " Make arrow and other keys work
     endif

    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set encoding=utf-8
    set modeline                " Turn on modeline

    if has('clipboard')
        if LINUX()   " On Linux use + register for copy-paste
            set clipboard=unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    "   let g:hw0wei_no_autochdir = 1
    if !exists('g:hw0wei_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    "set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    "   let g:hw0wei_no_restore_cursor = 1
    if !exists('g:hw0wei_no_restore_cursor')
        function! ResCur()
            if line("'\"") <= line("$")
                normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END
    endif

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        "   let g:hw0wei_no_views = 1
        if !exists('g:hw0wei_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }

    " No sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=

    " 显示活动页加亮
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    set cursorline cursorcolumn
    " ]]]

    " Vim UI [[[2
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
    endif

        nnoremap <silent>\e :colorscheme EditPlus<CR>
    if has  ('gui_running')
        nnoremap <silent>\2 :colorscheme seoul256-light<CR>
        nnoremap <silent>\e :colorscheme EditPlus<CR>
        nnoremap <silent>\s :colorscheme solarized<CR>
    endif

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    let g:CSApprox_hook_post = ['hi clear SignColumn']
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set textwidth=80                " Change text width
    set colorcolumn=+1              " Indicate text border
    set list                        " Show these tabs and spaces and so on
    set listchars=tab:›\ ,eol:¬,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set linebreak                   " Wrap long lines at a blank
    set showbreak=↪                 " Change wrap line break
    " ]]]

    " GUI Settings [[[2
    " GVIM-(here instead of .gvimrc)
    if has  ('gui_running')
        set guioptions-=T           " Remove the toolbar
        "set guioptions-=m
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        autocmd GUIEnter * simalt ~x    "windows GUI-MAX
        set lines=40                     " 40 lines of text instead of 24
        if LINUX    () && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif OSX  () && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif WINDOWS  () && has("gui_running")
            set guifont=DejaVu_Sans_Mono_for_powerline:h11,Courier_New:h11
        endif
    elseif
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
    " ]]]

    " Formatting [[[2
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set cindent                     " set C style indent
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    "   let g:hw0wei_keep_trailing_whitespace = 1
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> if !exists('g:hw0wei_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell setlocal nospell
    " ]]]

    " Search Related [[[2
    set ignorecase " Case insensitive search
    set smartcase " Case sensitive when uc present
    set hlsearch " Highlight search terms
    set incsearch " Find as you type search
    set gdefault " turn on 'g' flag

    " Use sane regexes
    nnoremap / /\v
    vnoremap / /\v
    cnoremap s/ s/\v
    nnoremap ? ?\v
    vnoremap ? ?\v
    cnoremap s? s?\v

    " Keep search matches in the middle of the window
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap * *zzzv
    nnoremap # #zzzv
    nnoremap g* g*zzzv
    nnoremap g# g#zzzv

    " Visual search mappings
    function! s:VSetSearch  ()
        let temp=@@
        normal! gvy
    let @/='\V'.substitute  (escape(@@, '\'), '\n', '\\n', 'g')
        let @@=temp
    endfunction
    vnoremap * :<C-U>call <SID>VSetSearch   ()<CR>//<CR>
    vnoremap # :<C-U>call <SID>VSetSearch   ()<CR>??<CR>

    " Use ,Space to toggle the highlight search
    nnoremap <Leader><Space> :set hlsearch!<CR>
    " ]]]

    " Folf Related [[[2
    set foldlevelstart=0 " Start with all folds closed
    set foldcolumn=1 " Set fold column

    " Space to toggle and create folds.
    nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    vnoremap <Space> zf

    " Set foldtext
    function! MyFoldText()
        let line=getline(v:foldstart)
        let nucolwidth=&foldcolumn+&number*&numberwidth
        let windowwidth=winwidth(0)-nucolwidth-3
        let foldedlinecount=v:foldend-v:foldstart+1
        let onetab=strpart(' ', 0, &tabstop)
        let line=substitute(line, '\t', onetab, 'g')
        let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
        let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
        return line.'…'.repeat(" ",fillcharcount).foldedlinecount.'…'.' '
    endfunction

    set foldtext=MyFoldText()
    " ]]]

    " Key (re)Mappings [[[2
    " Make j and k work the way you expect
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk

    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv

    " Repeat last substitution, including flags, with &.
    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

    " Keep the cursor in place while joining lines
    nnoremap J mzJ`z

    " Select entire buffer
    nnoremap vaa ggvGg_
    nnoremap Vaa ggVG

    " Map \<Space> to commenting
    function! IsWhiteLine()
        if (getline(".")=~"^$")
            let oldlinenumber=line(".")
            :call NERDComment('n', 'Sexy')
            if (line(".")==oldlinenumber)
                :call NERDComment('n', 'Append')
            else
                normal! k
                startinsert!
            endif
        else
            normal! A 
            :call NERDComment('n', 'Append')
        endif
    endfunction
    nnoremap <silent>\<Space> :call IsWhiteLine()<CR>

    " Strip all trailing whitespace in the current file
    nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

    " See the differences between the current buffer and the file it was loaded from
    command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
        \ | diffthis | wincmd p | diffthis

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    "   let g:hw0wei_no_easyWindows = 1
    if !exists('g:hw0wei_no_easyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    " Same for 0, home, end, etc
    function! WrapRelativeMotion(key, ...)
        let vis_sel=""
        if a:0
            let vis_sel="gv"
        endif
        if &wrap
            execute "normal!" vis_sel . "g" . a:key
        else
            execute "normal!" vis_sel . a:key
        endif
    endfunction

    " Map g* keys in Normal, Operator-pending, and Visual+select (over written
    " below) modes
    noremap $ :call WrapRelativeMotion("$")<CR>
    noremap <End> :call WrapRelativeMotion("$")<CR>
    noremap 0 :call WrapRelativeMotion("0")<CR>
    noremap <Home> :call WrapRelativeMotion("0")<CR>
    noremap ^ :call WrapRelativeMotion("^")<CR>
    " Over write the Visual+Select mode mappings to ensure correct mode is
    " passed to WrapRelativeMotion
    vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
    vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
    vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
    vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
    vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>

    " The following two lines conflict with moving to top and
    " bottom of the screen
    "   let g:hw0wei_no_fastTabs = 1
    if !exists('g:hw0wei_no_fastTabs')
        map <S-H> gT
        map <S-L> gt
    endif

    " Stupid shift key fixes
    if !exists('g:hw0wei_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " FIXME: Revert this f70be548
    " fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
    " ]]]

" ]]]

" Plugins_Configurations: [[[1~

    " Misc [[[2
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " ]]]

    " OmniComplete [[[2
        " To disable omni complete, add the following to your .vimrc.before.local file:
        "   let g:spf13_no_omni_complete = 1
        if !exists('g:spf13_no_omni_complete')
            if has("autocmd") && exists("+omnifunc")
                autocmd Filetype *
                    \if &omnifunc == "" |
                    \setlocal omnifunc=syntaxcomplete#Complete |
                    \endif
            endif

            hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
            hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
            hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

            " Some convenient mappings
            inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
            inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
            inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
            inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
            inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
            inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

            " Automatically open and close the popup menu / preview window
            au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
            set completeopt=menu,preview,longest
        endif
    " ]]]

    " Ctags [[[2
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " ]]]

    " AutoCloseTag [[[2 
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " ]]]

    " SnipMate [[[2 
        " Setting the author var
        let g:snips_author = 'HuangWei <hw0wei@163.com>'
    " ]]]

    " NerdTree [[[2 
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " ]]]

    " Tabularize [[[2 
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " ]]]

    " Session List [[[2 
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>
    " ]]]

    " JSON [[[2 
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " ]]]

    " PyMode [[[2 
        let g:pymode_lint_checker = "pyflakes"
        let g:pymode_utils_whitespaces = 0
        let g:pymode_options = 0
    " ]]]

    " ctrlp [[[2 
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        " On Windows use "dir" as fallback command.
        if WINDOWS()
            let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
        elseif executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        elseif executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }
    " ]]]

    " TagBar [[[2 
        nnoremap <silent> <leader>tt :TagbarToggle<CR>

        " If using go please install the gotags program using the following
        " go install github.com/jstemmer/gotags
        " And make sure gotags is in your path
        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
                \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
                \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
    " ]]]

    " PythonMode [[[2 
        " Disable if python support not present
        if !has('python')
            let g:pymode = 0
        endif
    " ]]]

    " Fugitive [[[2 
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    " ]]]

    " YouCompleteMe [[[
    if count(g:hw0wei_bundle_groups, 'youcompleteme')
        let g:acp_enableAtStartup = 0

        " enable completion from tags
        let g:ycm_collect_identifiers_from_tags_files = 1

        " remap Ultisnips for compatibility for YCM
        let g:UltiSnipsExpandTrigger = '<C-j>'
        let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        " Haskell post write lint and check with ghcmod
        " $ `cabal install ghcmod` if missing and ensure
        " ~/.cabal/bin is in your $PATH.
        if !executable("ghcmod")
            autocmd BufWritePost *.hs GhcModCheckAndLintAsync
        endif

        " For snippet_complete marker.
        if !exists("g:hw0wei_no_conceal")
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif
        endif

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview
    endif
    " ]]]

    " neocomplete [[[2 
        if count(g:hw0wei_bundle_groups, 'neocomplete')
            let g:acp_enableAtStartup = 0
            let g:neocomplete#enable_at_startup = 1
            let g:neocomplete#enable_smart_case = 1
            let g:neocomplete#enable_auto_delimiter = 1
            let g:neocomplete#max_list = 15
            let g:neocomplete#force_overwrite_completefunc = 1


            " Define dictionary.
            let g:neocomplete#sources#dictionary#dictionaries = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

            " Define keyword.
            if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
            endif
            let g:neocomplete#keyword_patterns['default'] = '\h\w*'

            " Plugin key-mappings {
                " These two lines conflict with the default digraph mapping of <C-K>
                if !exists('g:hw0wei_no_neosnippet_expand')
                    imap <C-k> <Plug>(neosnippet_expand_or_jump)
                    smap <C-k> <Plug>(neosnippet_expand_or_jump)
                endif
                if exists('g:hw0wei_noninvasive_completion')
                    iunmap <CR>
                    " <ESC> takes you out of insert mode
                    inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
                    " <CR> accepts first, then sends the <CR>
                    inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
                    " <Down> and <Up> cycle like <Tab> and <S-Tab>
                    inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
                    inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
                    " Jump up and down the list
                    inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
                    inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
                else
                    imap <silent><expr><C-k> neosnippet#expandable() ?
                                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                                \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
                    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

                    inoremap <expr><C-g> neocomplete#undo_completion()
                    inoremap <expr><C-l> neocomplete#complete_common_string()
                    inoremap <expr><CR> neocomplete#complete_common_string()

                    " <CR>: close popup
                    " <s-CR>: close popup and save indent.
                    inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup()"\<CR>" : "\<CR>"
                    inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

                    " <C-h>, <BS>: close popup and delete backword char.
                    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
                    inoremap <expr><C-y> neocomplete#close_popup()
                endif
                " <TAB>: completion.
                inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
                inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
            " }

            " Enable heavy omni completion.
            if !exists('g:neocomplete#sources#omni#input_patterns')
                let g:neocomplete#sources#omni#input_patterns = {}
            endif
            let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    " ]]]

    " neocomplcache [[[2 
        elseif count(g:hw0wei_bundle_groups, 'neocomplcache')
            let g:acp_enableAtStartup = 0
            let g:neocomplcache_enable_at_startup = 1
            let g:neocomplcache_enable_camel_case_completion = 1
            let g:neocomplcache_enable_smart_case = 1
            let g:neocomplcache_enable_underbar_completion = 1
            let g:neocomplcache_enable_auto_delimiter = 1
            let g:neocomplcache_max_list = 15
            let g:neocomplcache_force_overwrite_completefunc = 1

            " Define dictionary.
            let g:neocomplcache_dictionary_filetype_lists = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

            " Define keyword.
            if !exists('g:neocomplcache_keyword_patterns')
                let g:neocomplcache_keyword_patterns = {}
            endif
            let g:neocomplcache_keyword_patterns._ = '\h\w*'

            " Plugin key-mappings {
                " These two lines conflict with the default digraph mapping of <C-K>
                imap <C-k> <Plug>(neosnippet_expand_or_jump)
                smap <C-k> <Plug>(neosnippet_expand_or_jump)
                if exists('g:hw0wei_noninvasive_completion')
                    iunmap <CR>
                    " <ESC> takes you out of insert mode
                    inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
                    " <CR> accepts first, then sends the <CR>
                    inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
                    " <Down> and <Up> cycle like <Tab> and <S-Tab>
                    inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
                    inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
                    " Jump up and down the list
                    inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
                    inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
                else
                    imap <silent><expr><C-k> neosnippet#expandable() ?
                                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                                \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
                    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

                    inoremap <expr><C-g> neocomplcache#undo_completion()
                    inoremap <expr><C-l> neocomplcache#complete_common_string()
                    inoremap <expr><CR> neocomplcache#complete_common_string()

                    " <CR>: close popup
                    " <s-CR>: close popup and save indent.
                    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
                    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

                    " <C-h>, <BS>: close popup and delete backword char.
                    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
                    inoremap <expr><C-y> neocomplcache#close_popup()
                endif
                " <TAB>: completion.
                inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
                inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
            " }

            " Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

            " Enable heavy omni completion.
            if !exists('g:neocomplcache_omni_patterns')
                let g:neocomplcache_omni_patterns = {}
            endif
            let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
            let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
            let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    " ]]]

    " Normal Vim omni-completion [[[2 
    " To disable omni complete, add the following to your .vimrc.before.local file:
    "   let g:hw0wei_no_omni_complete = 1
        elseif !exists('g:hw0wei_no_omni_complete')
            " Enable omni-completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        endif
    " ]]]

    " Snippets [[[2 
        if count(g:hw0wei_bundle_groups, 'neocomplcache') ||
                    \ count(g:hw0wei_bundle_groups, 'neocomplete')

            " Use honza's snippets.
            let g:neosnippet#snippets_directory='$HOME/.vim/bundle/vim-snippets/snippets'

            " Enable neosnippet snipmate compatibility mode
            let g:neosnippet#enable_snipmate_compatibility = 1

            " For snippet_complete marker.
            if !exists("g:hw0wei_no_conceal")
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif
            endif

            " Disable the neosnippet preview candidate window
            " When enabled, there can be too much visual noise
            " especially when splits are used.
            set completeopt-=preview
        endif
    " ]]]

    " FIXME: Isn't this for Syntastic to handle?
    " Haskell post write lint and check with ghcmod
    " $ `cabal install ghcmod` if missing and ensure
    " ~/.cabal/bin is in your $PATH.
    if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    endif

    " Gundo [[[2 
        let g:gundo_width = 60
        let g:gundo_preview_height = 40
        let g:gundo_right = 1
        nnoremap <Leader>u :GundoToggle<CR>
    " ]]]

    " Golden Ratio [[[2
    " Disable Golden Ratio plugin when in diff mode
    if &diff
        let g:loaded_golden_ratio=1
    endif
    "]]]

    " Voom [[[2
        nnoremap <Leader>v :Voom<CR>
        nnoremap <Leader>vp :Voom pandoc<CR>
    " ]]]

    " numbers [[[2
        let g:enable_numbers = 0
        nnoremap <Leader>n :NumbersToggle<CR> 
    " ]]]

    " Syntastic [[[2
    let g:syntastic_check_on_open=1
    let g:syntastic_aggregate_errors=1
    let g:syntastic_auto_jump=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_style_error_symbol = '✠'
    let g:syntastic_warning_symbol = '∆'
    let g:syntastic_style_warning_symbol = '≈'
    " ]]]

    " Singlecompile [[[2
    nnoremap <Leader>r :SingleCompileRun<CR>
    let g:SingleCompile_showquickfixiferror=1
    function! ChoosePythonCompiler()
        echo 'Please choose python compiler:\n'
        echo '1. Python2+\n'
        echo '2. Python3+\n'
        let flag=getchar()
        if flag==49
            call SingleCompile#ChooseCompiler('python', 'python')
            execute 'SingleCompileRun'
        elseif flag==50
            call SingleCompile#ChooseCompiler('python', 'python3')
            execute 'SingleCompileRun'
        endif
    endfunction
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>
    " ]]]

    " indent_guides [[[2 
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " ]]]

    " vim-airline [[[2 
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
        "   let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if !exists('g:airline_theme')
            let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    " ]]]

" ]]]

" Functions [[[1~

    " Initialize directories [[[2
    function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir'}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                call mkdir(directory)
                exec 'set '.settingname.'='.directory
            else
                echo "Warning: Unable to create directory: ".directory
                echo "Try: mkdir -p ".directory
            endif
        else
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()
    " ]]]

    " Initialize NERDTree as needed [[[2
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " ]]]

    " Strip whitespace [[[2
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " ]]]

    " Shell command [[[2
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " ]]]

" ]]]

" Options: [[[1~

    " Restore cursor to file position in previous editing session
    "   let g:hw0wei_no_restore_cursor = 1

    " Prevent automatically changing to open file directory
    " 防止自动打开文件目录
    "   let g:spf13_no_autochdir = 1

    " Disable views
    " 禁止视图
    "   let g:spf13_no_views = 1

    " 禁止更容易的一大选项卡和窗口
    "   let g:hw0wei_no_easyWindows = 1

    " Disable fast tab navigation
    " 禁止快速选项卡导航
    "   let g:hw0wei_no_fastTabs = 1

    " Disable neosnippet expansion
    " This maps over <C-k> and does some Supertab
    " emulation with snippets
    "   let g:hw0wei_no_neosnippet_expand = 1

    " Disable whitespace stripping
    "   let g:hw0wei_keep_trailing_whitespace = 1

    " Enable powerline symbols
    "   let g:airline_powerline_fonts = 1

    " vim files directory
    "   let g:hw0wei_consolidated_directory = <full path to desired directory>
    "   eg: let g:hw0wei_consolidated_directory = $HOME . '/.vim/'

    " This makes the completion popup strictly passive.
    " Keypresses acts normally. <ESC> takes you of insert mode, words don't
    " automatically complete, pressing <CR> inserts a newline, etc. Iff the
    " menu is open, tab will cycle through it. If a snippet is selected, <C-k>
    " expands it and jumps between fields.
    "   let g:hw0wei_noninvasive_completion = 1

    " Don't turn conceallevel or concealcursor
    "   let g:spf13_no_conceal = 1

    " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
    " Indent guides will attempt to set your colors smartly. If you
    " want to control them yourself, do it here.
    "   let g:indent_guides_auto_colors = 0
    "   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=233
    "   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=234

    " Disable  omni complete
    "   let g:hw0wei_no_omni_complete = 1

    " Don't create default mappings for multicursors
    " See :help multiple-cursors-mappings
    "   let g:multi_cursor_use_default_mapping=0
    "   let g:multi_cursor_next_key='<C-n>'
    "   let g:multi_cursor_prev_key='<C-p>'
    "   let g:multi_cursor_skip_key='<C-x>'
    "   let g:multi_cursor_quit_key='<Esc>'
    " Require a special keypress to enter multiple cursors mode
    "   let g:multi_cursor_start_key='+'

" ]]]

