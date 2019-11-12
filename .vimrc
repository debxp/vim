set nocompatible
execute pathogen#infect()
filetype indent plugin on
syntax on
set hidden
set confirm
set t_Co=256
" -----------------------------------------------------------------------------
set showcmd
set path+=**
set wildmenu
set wildmode=list:longest,full
set cursorline
hi cursorline cterm=NONE ctermbg=0 ctermfg=NONE
set number
set relativenumber
" -----------------------------------------------------------------------------
set mouse=a
" -----------------------------------------------------------------------------
set wrap
set linebreak nolist
set showbreak=…\ 
set listchars=tab:\|\ ,space:·,eol:¬
" -----------------------------------------------------------------------------
" colorscheme antares
" colorscheme apprentice
" colorscheme archery
" colorscheme bitterjug 
" colorscheme blaquemagick 
" colorscheme blues 
" colorscheme bubblegum-256-dark 
" colorscheme bvemu
" colorscheme codedark
" colorscheme crunchbang
" colorscheme CandyPaper
" colorscheme darth
" colorscheme deep-space
" colorscheme deus
" colorscheme dracula
" colorscheme elda
" colorscheme eldar
" colorscheme elrond
" colorscheme flattened_dark 
" colorscheme forneus
" colorscheme greenvision
" colorscheme highwayman
" colorscheme holokai
" colorscheme horseradish256
" colorscheme hydrangea
" colorscheme iceberg
" colorscheme inori
" colorscheme ir_black
" colorscheme itg_flat_transparent
" colorscheme jellybeans 
" colorscheme jellyx
" colorscheme landscape
" colorscheme last256
" colorscheme lxvc
" colorscheme mango
" colorscheme molokai
" colorscheme monokain
" colorscheme moody
" colorscheme mythos
" colorscheme neodark
" colorscheme nord
" colorscheme petrel
" colorscheme seoul256
" colorscheme smyck
" colorscheme solarized8_dark 
" colorscheme sorcerer 
" colorscheme thor

" -----------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
" -----------------------------------------------------------------------------
set backspace=indent,eol,start
set autoindent
set nostartofline
set shiftwidth=4
set tabstop=4
" -----------------------------------------------------------------------------
hi SpellBad cterm=NONE ctermfg=0 ctermbg=1
" -----------------------------------------------------------------------------
" MAPPINGS
" -----------------------------------------------------------------------------
" No escape! - In INSERT mode, use ^t and ^d to 'tab' and 'de-tab'
"              In NORMAL mode, >> and << do the same
" imap <Tab> <Esc>

" Auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Jump up and down into screen lines, not real lines...
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Circle buffer next and previous
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Quick close...
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i

" Toggle search highlight...
noremap <F3> :set hlsearch!<CR>
inoremap <F3> <C-o>:set hlsearch!<CR>
cnoremap <F3> <C-c>:set hlsearch!<CR>

" Toggle line wrapping...
noremap <F4> :set wrap!<CR>
inoremap <F4> <C-o>:set wrap!<CR>
cnoremap <F4> <C-c>:set wrap!<CR>

" Toggle invisible chars...
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Toggle spell check...
noremap <F6> :set spell! spelllang=pt,en<CR>
inoremap <F6> <C-o>:set spell! spelllang=pt,en<CR>
cnoremap <F6> <C-c>:set spell! spelllang=pt,en<CR>

" Move line up and down...
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Toggle NERDTree
noremap <silent> <C-e> :NERDTreeToggle<CR>
inoremap <silent> <C-e> <C-o>:NERDTreeToggle<CR>

" Use CTRL-S for saving, also in Insert mode
" Important! First, put this in ~/.bashrc
" stty -ixon
noremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>

" -----------------------------------------------------------------------------
" STATUSLINE
" -----------------------------------------------------------------------------
au InsertEnter * hi statusline cterm=NONE ctermfg=0 ctermbg=5
au InsertLeave * hi statusline cterm=NONE ctermfg=0 ctermbg=10
hi statusline cterm=NONE ctermfg=0 ctermbg=10

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set cmdheight=1
set laststatus=2
set noshowmode

set statusline=
set statusline+=\ %n\ 
set statusline+=%1*\ %t
set statusline+=%m\ 
set statusline+=%2*\ %Y\ 
set statusline+=%{''.toupper(&fenc!=''?&fenc:&enc).''}
set statusline+=\ (%{toupper(&ff)})
set statusline+=%=
set statusline+=Col:%v\ 
set statusline+=Row:%l/%L\ (%P)\ 
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\ 

hi User1 ctermfg=7 ctermbg=8
hi User2 ctermfg=7 ctermbg=0
hi User3 ctermfg=7 ctermbg=darkred
" -----------------------------------------------------------------------------
" TABLINE
" -----------------------------------------------------------------------------
hi TabLine      ctermfg=254  ctermbg=69  cterm=NONE
hi TabLineFill  ctermfg=254  ctermbg=69  cterm=NONE
hi TabLineSel   ctermfg=254  ctermbg=25  cterm=NONE

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? ' '. fnamemodify(bufname, ':t') . '  ' : ' [Sem nome] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction

set tabline=%!Tabline()


