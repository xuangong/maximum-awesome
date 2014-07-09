" tpope/vim-commentary gcc gcap
" Auto Session Save/Restore
" function GetProjectName()
"     " Get the current editing file list, Unix only
"     let edit_files = split(system("ps -o command= -p " . getpid()))
"     if len(edit_files) >= 2
"         let project_path = edit_files[1]
"         if project_path[0] != '/'
"             let project_path = getcwd() . project_path
"         endif
"     else
"         let project_path = getcwd()
"     endif
"
"     return shellescape(substitute(project_path, '[/]', '', 'g'))
" endfunction

" function SaveSession()
"     "NERDTree doesn't support session, so close before saving
"     execute ':NERDTreeClose'
"     let project_name = GetProjectName()
"     execute 'mksession! ~/.vim/sessions/' . project_name
"     execute 'mkview'
" endfunction

" function RestoreSession()
"     let session_path = expand('~/.vim/sessions/' . GetProjectName())
"     if filereadable(session_path)
"         execute 'so ' . session_path
"         if bufexists(1)
"             for l in range(1, bufnr('$'))
"                 if bufwinnr(l) == -1
"                     exec 'sbuffer ' . l
"                 endif
"             endfor
"         endif
"     endif
"     execute 'loadview'
"     "Make sure the syntax is on
"     syntax on
" endfunction
" autocmd VimEnter * nested call RestoreSession()
" set sessionoptions-=folds  " I need folds restored, comment this command
" set sessionoptions-=options  " Don't save options

" function DeleteSession()
"     let session_path = expand('~/.vim/sessions/' . GetProjectName())
"     if filereadable(session_path)
"         execute '!rm -f ' . session_path
"     endif
" endfunction

" nmap sc :call DeleteSession()<CR>
" nmap ss :call SaveSession()<CR>
" nmap sr :call RestoreSession()<CR>

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" set ctags setting by xuangong
set tags=tags
" set autochdir

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

" supertab
" let g:SuperTabRetainCompletionType=2
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:-
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                           " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set hlsearch
set smartindent
set smarttab

" Enable basic mouse behavior such as resizing buffers.
set mouse=
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader>c :only<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>k <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" backspace to toggle commentary
nmap <BS> gcc
vmap <BS> gc
" edit the snippet
nmap <leader>u :UltiSnipsEdit<CR>
" Type enter key to display BufferList, and select a list then press enter
" again can edit the selected buffer
noremap <silent> <CR> :BufExplorer<CR>
" EasyMotion: <leader><leader><char>
let g:EasyMotion_leader_key = 'f'


" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>m :MRU<CR>

let g:indentLine_first_char = '┆'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          "enable fold
set foldmethod=marker
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

let g:user_emmet_settings = {
    \  'indentation' : '    ',
    \  'perl' : {
    \    'aliases' : {
    \      'req' : 'require '
    \    },
    \    'snippets' : {
    \      'use' : "use strict\nuse warnings\n\n",
    \      'warn' : "warn \"|\";",
    \    }
    \  }
    \}

let g:user_emmet_leader_key = '<c-e>'
" let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" indent
au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \     exe "normal! g'\"" |
      \ endif

let g:indentLine_char='|'
let g:indentLine_first_char='|'


"============================================================
"                  解决UltiSnips和YCM的冲突
"============================================================
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets' includes UltiSnips's snippets
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<tab>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-s-tab>"

let g:SuperTabDefaultCompletionType = '<c-tab>'

let g:ycm_key_list_select_completion = ['<c-tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-s-tab>', '<Up>']
"============================================================




" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    "回车即选中当前项

"==================这几个是具体作用也不知道=================
" 上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" " 提示的备选项中有一些是snippet, 这里直接在snippet选项中最上最下
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"===========================================================
let g:ycm_confirm_extra_conf = 0                                    " 关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files = 1                   " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion = 2                       " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc = 0                                        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax = 1                          " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>                    " 这force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>  " open locationlist
" nnoremap <leader>lc :lclose<CR> " close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_complete_in_comments = 1                                  " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                                   " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0         " 注释和字符串中的文字也会被收入补全
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nmap <F4> :YcmDiags<CR>


" better rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
