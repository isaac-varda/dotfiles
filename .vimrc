" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif




" Use Vim settings
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  filetype indent on
  filetype plugin on
    
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
	"ruby
	autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
	autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
	autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
	autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
	"improve autocomplete menu color
	highlight Pmenu ctermbg=238 gui=bold
	  

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


set number
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 


let mapleader = ","
autocmd FileType python map <F5> :w<CR>:!screen -x ipython -X stuff $'\%reset\ny\n\%cd %:p:h\n\%run %:t\n'<CR><CR>

filetype plugin on
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

if $VIM_CRONTAB == "true"
set nobackup
set nowritebackup
endif
set t_Co=256
colorscheme sunburst

" A bunch of things added 
" from http://amix.dk/vim/vimrc.html
" Easy vimrc editing
"completes longest possible part,then lets you type more
set  wildmode=longest:full
set wildmenu "Turn on WiLd menu
" Automatically reload changed file
set autoread
" use mouse support
set mouse=a

" Searching
set ignorecase " ignore case when searching
set smartcase " Not really sure...

set nobackup
set nowb
set noswapfile
"Persistant undo
try
	if MySys() == "windows"
		set undodir=C:\Windows\Temp
	else
		set undodir=~/.vim_runtime/undodir
	endif

	set undofile
catch
endtry
"Tab Related stuff
set ts=4
set shiftwidth=4
"set expandtab " this should be moved into the python specific file
set smarttab

set lbr
set tw=500
"Auto Indent magic"
set ai "Auto  indent
set si "Smart indent
set wrap "Wrap lines... this could be sketch


"Visual  Mode Related tweeks
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('f')<CR>



"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
map <leader>v :vsp 



map <leader>ss :setlocal spell!<cr>
map <leader>r : source ~/.vimrc<cr>
map <leader>e :vsp! ~/.vimrc<cr>
map <leader>E :sp! ~/.vimrc<cr>
map <F4> :echo 'Current time is ' . strftime('%c')<CR>
map <F3> :TlistToggle<cr>

" Yank ring
" MRU Plugin Stuff
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>
"autocmd FileType python compiler pylint

au! BufRead,BufNewFile *.scad    set filetype=openscad " Should be split out into seperate file later

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
