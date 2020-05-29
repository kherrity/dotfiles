" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.  
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype off

" Set encoding to utf-8
set encoding=utf8

" Vundle
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end
Plugin 'morhetz/gruvbox'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'universal-ctags/ctags'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'simnalamburt/vim-mundo'

call vundle#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
" syntax on
syntax enable

" From stevelosh.com/blog/2010/09/coming-home-to-vim
set scrolloff=3
set showmode
set wildmode=list:longest
set cursorline
set ttyfast
set wrap
set textwidth=79
set formatoptions=qrn1
" To yank to the Windows clipboard
set clipboard=unnamedplus
" Autosave when focus is lost
au FocusLost * :wa
let mapleader = ","

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Copy to system clipboard
"vnoremap <C-c> "+yy
set clipboard=unnamedplus

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use incremental search
set incsearch

" Show match
set showmatch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2
set statusline=[%n]\ %<%f%h%m

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set wmh=0

" Ignore/exclude "out" directory from listings
set wildignore+="out/"

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Show tabs
set list
set listchars=tab:>-

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Add debug signature
"nmap <C-^> :s/$/ \/\/--KH/g \| nohl <CR>
" comment out line
nmap <C-u> :s/^/\/\//g \| nohl <cr>

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
" nnoremap <C-L> :nohl<CR><C-L>

" Turn off highligted search
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" Display buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" Toggle Syntastic
silent! nmap <F6> :SyntasticToggleMode<CR>
" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

nnoremap ; :

" Count number of occurrences of searched word
nmap ,c :%s///gn <CR>

"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
" --------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Generate cscope.out within VIM
" exclude dirs: ./out
nmap <F7> :!find . -path './out' -prune -o -path './vendor' -prune -o -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -q -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

nmap <F3> :!cat mycscope.txt \| xargs build_colossus<CR>
  \:cs reset<CR>

" Pathogen
" call pathogen#infect()

" mapping to edit .vimrc quickly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" mapping to exit back to normal mode
inoremap jj <esc>

" mapping to reselect text that was pasted to perform commands
nnoremap <leader>v v`]

" Splitting windows
"------------------------
" new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"------------------------------------------------------------
" plugin options {{{1
"
" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
" change default blue color of folders to red
hi directory guifg=#ff0000 ctermfg=red

" ctrlp
" exclude directories or files from the search.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.txt$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack! --ignore-dir={out,export} --type-set=EX={.d,.asm} --noEX 

" Coverity
" load Coverity command
let coverity_vimrc = $HOME . "/.vim/plugin/coverity.vimrc"
if filereadable(coverity_vimrc)
execute "source " . fnameescape(coverity_vimrc)
endif
" EOF

" Folding
set foldmethod=syntax
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
" Note: to disable, 'set nofoldenable'

"Remove all trailing whitespace by pressing F10
nnoremap <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Color scheme
syntax enable
set background=dark
colorscheme gruvbox
"colorscheme solarized

" Fugitive (Git) settings
command! Greview :Git! diff --staged
nnoremap <leader>gr :Greview<cr>

" Syntastic plugin options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra -Wpedantic'
