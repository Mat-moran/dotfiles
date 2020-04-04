set encoding=utf-8

" General settings {{{
    set nocompatible            " disable compatibility to old-time vi
    set showmatch               " show matching brackets.
    set ignorecase              " case insensitive matching
    set mouse=v                 " middle-click paste with mouse
    set hlsearch                " highlight search results
    set tabstop=4               " number of columns occupied by a tab character
    set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    set expandtab               " converts tabs to white space
    set shiftwidth=4            " width for autoindents
    set autoindent              " indent a new line the same amount as the line just typed
    set number                  " add line numbers
    set wildmode=longest,list   " get bash-like tab completions
    set cc=80                   " set an 80 column border for good coding style
 "   set foldmethod=manual       " set an 80 column border for good coding style
    set termguicolors           " enable true colors
    set splitright              " more natura split
    set nobackup nowritebackup  " no swap file
	set tags=tags               " tags 
    filetype plugin indent on   " allows auto-indenting depending on file type
    syntax on                   " syntax highlighting
" }}}

    inoremap ii <Esc>
    let mapleader = " "
    set relativenumber          " set relative numbers
    map <Enter> o<ESC>
    map <S-Enter> O<ESC>


" Plugin             ----------------------------------- {{{


    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin(stdpath('data') . '/plugged')

    " For completion
	if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
  		Plug 'roxma/nvim-yarp'
  		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	let g:deoplete#enable_at_startup = 1
    Plug 'deoplete-plugins/deoplete-jedi'                             " For python completion

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " themes, colors and information
    Plug 'rakr/vim-one'                                               " A theme
    Plug 'vim-airline/vim-airline'                                   " Status bar
    Plug 'vim-airline/vim-airline-themes'                            " themes for the status bar
    Plug 'ap/vim-css-color'                                           " themes for the status bar
    Plug 'ryanoasis/vim-devicons'                                   
    
    "terminal and filesystem navigation
    Plug 'kien/ctrlp.vim'
    Plug 'kassio/neoterm'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mhinz/vim-startify'

    " syntax 
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'

    " others
    Plug 'vimwiki/vimwiki'

    " Git plugin
    Plug 'tpope/vim-fugitive'
    " Initialize plugin system
    call plug#end()
    " }}}
    "

	set noshowmode                                                     " to quit the  --INSERTAR -- info because is in the lightline info bar

    " Searching configuration
	" remap :CtrlP
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
    " Search in the nearest ancestor that contains one of .git files
    let g:ctrlp_working_path_mod = 'r'
	" ignore files
	set wildignore+=*.a,*.o
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
	set wildignore+=*.git,*.hg,*.svn
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
	
	
    " Folding experience
    
    " NO FUNCIONA CORRECTAMENTE 
    "augroup filetype_python
    " Python Folding
    "function! PYfold()
    "    return 1
    "endfunction

    "autocmd FileType python setlocal foldmethod=indent
    "autocmd FileType javascript setlocal foldmethod=syntax
"   augroup END
    let g:vimwiki_folding='expr'
" Vim Script file settings ------------------------ {{{
    augroup filetype_vim
      autocmd!
      autocmd FileType vim setlocal foldmethod=marker
    augroup END
    " }}}v
    "augroup remember_folds
    "    autocmd!
    "    autocmd BufWinLeave * mkview
    "    autocmd BufWinEnter * silent! loadview
    "augroup END

" UI Customizations ----------------------------------- {{{

    colorscheme one
    set background=dark
        let g:one_allow_italics = 1                                  " I love italic for commentsh
        call one#highlight('elixirInclude', 'e06c75', '', 'none')
        call one#highlight('elixirOperator', 'd19a66', '', 'none')
        call one#highlight('vimTodo', '000000', '', 'none')
    let g:limelight_conceal_ctermfg = '#454d5a'
    let g:limelight_conceal_guifg = '#454d5a'
    let g:limelight_conceal_guifg = '#454d5a'
    
   highlight ColorColumn ctermbg=236 guibg=#303030
   let &colorcolumn=join(range(80,999),',')


	"let g:lightline = {'colorscheme': 'one'}
    "set guifont=Liberation\ Mono\ for\ Powerline\ 10 
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_powerline_symbols = 1
    let g:webdevicons_enable_airline_tabline = 1
    let g:webdevicons_enable_airline_statusline = 1


" }}}
    " Terminal customization
" tions ----------------------------- {{{

"    tnoremap <c-h> <C-\><C-n><C-w>h
"    tnoremap <c-j> <C-\><C-n><C-w>j
"    tnoremap <c-k> <C-\><C-n><C-w>k
"    tnoremap <c-l> <C-\><C-n><C-w>l

" }}}
    " set cursor modes
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175
    "
" Key mappings ---------------------------------------- {{{
    
    " interactive replace preview
    set inccommand=nosplit

    " replace the word under de cursor, globally, with confirmation
    nnoremap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
    "vnoremap <Leader>k y :%s/<C-r>"//gc<Left><Left><Left>
    

    " resize window 
    nnoremap <silent> <Leader>vr :vertical resize 30<CR>
    nnoremap <silent> <Leader>r+ :vertical resize +5<CR>
    nnoremap <silent> <Leader>r- :vertical resize -5<CR>
    nnoremap <silent> <Leader>r- :vertical resize -5<CR>
    " move throw windows
    nnoremap <C-J> <C-W><C-J>                                      " Ctrl-j instead of Ctrl-w j:w
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" }}}


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " NERDTree Customizations ----------------------------- 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Uncomment to autostart the NERDTree
    " autocmd vimenter * NERDTree
    " How can I close vim if the only window left open is a NERDTree?
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeMinimalUI = 1
    let g:NERDTreeWinSize = 25
    let g:NERDTreeShowBookmarks=1
    nnoremap <Leader>nn :NERDTreeToggle<Enter>
    nnoremap <silent> <Leader>nf :NERDTreeFind<CR>


    " Snippets configuration
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    
    
    
    
    autocmd VimEnter *
                \   if !argc()
            \ |   Startify
            "\ |   NERDTree
            \ |   wincmd w
            \ | endif
