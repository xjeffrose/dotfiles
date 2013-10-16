let g:dotvim_settings = {}
let g:dotvim_settings.version = 1


" here are some basic customizations, please refer to the top of the vimrc file for all possible options
"let g:dotvim_settings.default_indent = 3
"let g:dotvim_settings.max_column = 80
"let g:dotvim_settings.colorscheme = 'my_awesome_colorscheme'

" by default, language specific plugins are not loaded.  this can be changed with the following:
"let g:dotvim_settings.plugin_groups_exclude = ['ruby','python']

" if there are groups you want always loaded, you can use this:
let g:dotvim_settings.plugin_groups_include = ['core', 'autocomplete', 'editing', 'scm', 'unite', 'scala', 'python']

" alternatively, you can set this variable to load exactly what you want
"let g:dotvim_settings.plugin_groups = ['core']

" if there is a particular plugin you don't like, you can define this variable to disable them entirely
"let g:dotvim_settings.disabled_plugins=['vim-foo','vim-bar']


" finally, load the distribution
source ~/.vim/vimrc

" anything defined here are simply overrides
  command! W :w
  command! Q :q!
  command! Wq :wq

  " Paste from clipboard
  map <leader>p "+p
  " Toggle NERDTree
  map <leader>n :NERDTreeToggle<CR>
  " Run Unite file search
  map <leader>f :Unite file<CR>
  map <c-j> <c-w>j
  map <c-k> <c-w>k
  map <c-l> <c-w>l
  map <c-h> <c-w>h


