return {
    "lervag/vimtex",
    init = function ()
	vim.cmd("syntax enable")

	vim.g.vimtex_view_method = "zathura"
    end
}
