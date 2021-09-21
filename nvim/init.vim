"source .vimrc
let &packpath = &runtimepath
let g:doom_one_terminal_colors = v:true
source ~\.config\nvim\.vimrc

"terminal colorscheme
if (has("termguicolors"))
	set termguicolors
endif

