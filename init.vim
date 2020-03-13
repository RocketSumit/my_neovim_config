call plug#begin('~/.vim/plugged')
Plug 'skielbasa/vim-material-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'

Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'yggdroot/indentline'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ciaranm/detectindent'
Plug 'airblade/vim-gitgutter'

Plug 'luochen1990/rainbow'

Plug 'flazz/vim-colorschemes'

Plug 'easymotion/vim-easymotion'
Plug 'sickill/vim-pasta'

Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-repeat'

Plug 'ryanoasis/vim-devicons'

Plug 'zhou13/vim-easyescape'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'

call plug#end()

let g:rainbow_active=1

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

map <Leader> <Plug>(easymotion-prefix)
map f <Plug>(easymotion-bd-w)
let g:EasyMotion_use_upper=1
let g:EasyMotion_keys='SADFJKLEWCMPGH'
let g:Easymotion_smartcase=1
let g:EasyMotion_use_smartsign_us=1

set background=dark
set termguicolors

set mouse=a
set number
set clipboard=unnamedplus

nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
" noremap 0 g0
" noremap $ g$

" Copy to clipboard
vnoremap y "+y
nnoremap Y "+yg_
nnoremap y "+y
nnoremap yy "+yy

" Paste from clipboard
nnoremap P "+p
nnoremap p "+P
vnoremap P "+p
vnoremap p "+P

" This remaps arrow keys to switch between windows
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

tnoremap <Esc> <C-\><C-n>

set tildeop

au BufWinEnter * :DetectIndent
let g:airline_powerline_fonts = 1
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

set incsearch

let g:indentLine_enabled = 1

" Yes, the space exists
set list lcs=tab:\¦\ 
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" For relative number stuff
set relativenumber

" To replace stuff globally
set gdefault

" Coz redo should be U
nnoremap U <C-r>

" To break long lines
set breakindent
set breakindentopt=shift:2
set showbreak=↳

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

colorscheme material-monokai

" ignores cases for search
set ignorecase

" Opens files in buffer in a menu with Space + Tab
set wildcharm=<Tab>
nnoremap <Leader><Tab> :buffer<Space><Tab>

" To execute a macro over visual line selections
xnoremap Q :'<,'>:normal @q<CR>

" Set undodir
set undofile
set undodir=/tmp/nvim_undo_history

" Window size specific settings for easy-motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

let g:lightline#bufferline#enable_devicons = 1

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 200
cnoremap jk <ESC>
cnoremap kj <ESC>

" Flutter specifics
nnoremap <leader>fe :CocCommand flutter.emulators<CR>
nnoremap <leader>fr :CocCommand flutter.run<CR>
nnoremap <leader>fq :CocCommand flutter.dev.quit<CR>
nnoremap <leader>fh :CocCommand flutter.dev.hotReload<CR>
nnoremap <leader>fR :CocCommand flutter.dev.hotRestart<CR>
nnoremap <leader>fo :CocCommand flutter.dev.openDevLog<CR>
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:lsc_auto_map = v:true

set completeopt=menu,menuone,preview,noselect,noinsert

" CoC below
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Window tab thingies
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

nnoremap H ^
nnoremap L $
nnoremap ; :

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <C-f> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=25

" vista
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
let g:vista_default_executive = 'coc'
" let g:vista_sidebar_position='vertical botleft'
let g:vista_sidebar_width=25
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

nnoremap <Space>f :Files<CR>
nmap <silent> <C-Up> :wincmd K<CR>
nmap <silent> <C-Down> :wincmd J<CR>
nmap <silent> <C-Left> :wincmd H<CR>
nmap <silent> <C-Right> :wincmd L<CR>

let g:coc_global_extensions = [
      \'coc-word',
      \'coc-syntax',
      \'coc-spell-checker',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-lists',
      \'coc-highlight',
      \'coc-git',
      \'coc-emoji',
      \'coc-dictionary',
      \'coc-calc',
      \'coc-actions',
      \'coc-markdownlint',
      \'coc-json',
      \'coc-java',
      \'coc-flutter',
      \'coc-python',
      \'coc-docker',
      \'coc-clangd',
      \'coc-cmake',
      \'https://github.com/Nash0x7E2/awesome-flutter-snippets'
      \]
