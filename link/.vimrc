" Mihir's .vimrc


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
" From: Matin Brochhaus
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Set Leader as ,
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" Show line numbers
set number


" Useful settings
set history=100
set undolevels=100


" don't use TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim

" Begin Vundle Block
" All plugins should be listed between the begin and end blocks
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
if v:version > 703 || (v:version == 703 && has("patch584") && has("python"))
        Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'tsukkee/unite-tag'
Plugin 'Shougo/neocomplcache.vim'

" End Vundle Block
call vundle#end()
filetype plugin indent on " required for Vundle

" Settings for YCM
let g:ycm_show_diagnostics_ui=0

" Settings for vim-colors-solarized
syntax enable
set background=dark
let g:solarized_termtrans=1 " Required for transparent Terminal
let g:solarized_termcolors=256 " Required for OSX Terminal
colorscheme solarized


" Settings for vim-powerline
set laststatus=2


" Settings for tagbar
nmap t :TagbarToggle<CR>


" Settings for tagbar
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_enable_start_insert=1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <c-p> :Unite file_rec/async<cr>
nnoremap <Space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>t :Unite tag<cr>
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\ })

"autocmd FileType unite call s:unite_my_settings()
"    function! s:unite_my_settings()
              " Overwrite settings
"              nmap <silent><buffer> <Esc> :UniteClose<cr>
"              imap <silent><buffer> <Esc> :UniteClose<cr>
"    endfunction


" YouCompleteMe
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui=0
let g:neocomplcache_enable_at_startup=0


" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable
