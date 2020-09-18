" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" pathogen runntime injection and help indexing
call pathogen#infect()
call pathogen#helptags()

" syntax highlighting
syntax on

" Default color scheme
colorscheme desert


" turn filetype detection, indent scripts and filetype plugins on
filetype plugin indent on
filetype on


"""""""""""""""""""""""
"       PLUGINS     " 
"""""""""""""""""""""""
" avoid easy tags making vim wait to write the .vimtags file
let g:easytags_async=1

" enables ctags
set tags=tags

" line numbers on left side
set number
"set relativenumber



" NERDTree configuration
let NERDTreeIgnore=['r/.pyc$', '/.rbc$', '/\~$']
map <Leader>n :NERDTreeToggle<CR>

" ZoomWin
map <Leader><Leader> :ZoomWin<CR>

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways


" indent
let g:indentLine_char = '|'

" airline
let g:airline#extensions#clock#format = '%a %b %-d %-I:%M %p'

"""""""""""""""
" Pymode
"""""""""""""""

let g:pymode_lint_on_write=0

"""""""""""""""
" Syntastic  
"""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pylint_args = '-E' " Just show pylint errors
let g:syntastic_check_on_open = 0 " Do not run when opening files
let g:syntastic_check_on_wq = 0 "run when writing/closing files
let g:syntastic_exit_checks = 0
let g:syntastic_mode_map = { 'mode': 'passive'  } " Start syntastic in passive mode
let g:syntastic_tex_checkers=['chktex']
"""""""""""""""
"""""""""""""""




"""""""""""""""""""""""
" CUSTOMIZED MAPPINGS " 
"""""""""""""""""""""""

nnoremap ; :
nnoremap , ;

" Prep word for replacement
nmap <C-\> yiw:%s/<C-R><C-W>//g<Left><Left>


nmap <C-A> :let g:syntastic_python_pylint_args = ''<CR><C-S>
imap <C-A> <Esc>:w<CR><C-A>

" copy selection to clipboard
vmap <C-C> "*y

" Toggle Syntastic between passive and active mode
nmap <C-E> :SyntasticToggleMode<CR>

nmap <C-H> :lclose<CR>
imap <C-H> <Esc><C-H>

imap <C-I> <C-I>

"set nofoldenable    " disable folding
let g:AutoPairsShortcutFastWrap = '<C-K>'

" next buffer location
nmap <C-L> :let @+=expand("%:p")<CR>
" nmap <C-L> :bnext<Enter>
imap <C-L> <Esc><C-L>
vmap <C-L> <Esc><C-L>

" Toggle paste
set pastetoggle=<C-P>


" run syntastic checker
nmap <C-S> :SyntasticCheck<CR>

nmap <C-T> :w <CR> [c ^ w viw"*y:!python -m unittest -v test.<C-R>" <CR>


 "copy current line to clipboard
nmap <C-X> Vy
vmap <C-X> <Esc><C-X>

" execute current line
" nmap <C-E> : .w !bash<Enter> 






" previous buffer location
"nmap <C-K> :bprevious<Enter>
"imap <C-K> <Esc><C-K>
"vmap <C-K> <Esc><C-K>










" copy word to word ignoring punctuation
"vmap <C-J> iW"*y
"nmap <C-J> v<C-J>





"""""""""""""""""""""""""""
" END CUSTOMIZED MAPPINGS " 
"""""""""""""""""""""""""""

" enable ruby folding, default to unfolded
let ruby_fold=1
"set foldlevelstart=99

" Show (partial) command in the status line
set showcmd


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set hlsearch " highlight all search matches
set incsearch " While typing a search command, show where the pattern, as it was typed, matches "
set ignorecase "If the 'ignorecase' option is on, the case of normal letters is ignored.
set smartcase "Override the 'ignorecase' option if the search pattern contains upper case characters


set showmatch
set tabstop=4 " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4 "  Number of spaces to use for each step of (auto)indent
set autoindent " Copy indent from current line when starting a new line
set smarttab " a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set expandtab " Spaces are used in indents
set softtabstop=4 " Number of spaces that a <Tab> counts for while performing editing operations
"set textwidth=80

" enables sharing of Mac OS X clipboard
set clipboard=unnamed

set wildmode=list:longest,list:full " Tab completion behavior
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/* "A file that matches with one of these patterns is ignored when expanding wildcards,"





" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType make set noexpandtab


let cmdline_app           = {}
let cmdline_app["python"] = 'ipython'

" vimcmdline mappings
let cmdline_map_start          = "<LocalLeader>s"
let cmdline_map_send           = "<Space>"
let cmdline_map_send_and_stay  = "<LocalLeader><Space>"
let cmdline_map_source_fun     = "<LocalLeader>f"
let cmdline_map_send_paragraph = "<LocalLeader>p"
let cmdline_map_send_block     = "<LocalLeader>b"
let cmdline_map_quit           = "<LocalLeader>q"

" vimcmdline options
let cmdline_vsplit             = 0      " Split the window vertically
"let cmdline_esc_term           = 1      " Remap <Esc> to :stopinsert in Neovim terminal
let cmdline_in_buffer          = 1      " Start the interpreter in a Neovim buffer
let cmdline_term_height        = 15     " Initial height of interpreter window or pane
let cmdline_term_width         = 80     " Initial width of interpreter window or pane
let cmdline_tmp_dir            = '/tmp' " Temporary directory to save files
let cmdline_outhl              = 1      " Syntax highlight the output


function! MyFormatExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)







let g:riv_disable_indent=1




"set foldmethod=syntax
au FileType py UpdateRemotePlugins






" Disable arrow keys. Use hjkl.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:tq_map_keys=0


" Do not spell check comments in tex files
let g:tex_comment_nospell=1


xnoremap <silent> p p:let @"=@0<CR>
let g:SpellCheck_ConsideredErrorTypes = ['bad', 'local', 'caps']



" pydocstring
let g:pydocstring_templates_dir="$HOME/.vim/templates/pydocstring"
nmap <silent> <C-m> <Plug>(pydocstring)

"nmap <C-I> diw"=strftime("%Y%m%d%H%M")<CR>P 
"nnoremap <C-I> "=strftime("%c")<CR>P 
"inoremap <C-I> <C-R>=strftime("%c")<CR>



" VIM-PLUG https://github.com/junegunn/vim-plug
"
"" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"
Plug 'b4b4r07/vim-sqlfmt'


" Initialize plugin system
call plug#end()



let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"

autocmd FileType python setlocal completeopt-=preview

"let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot=0
