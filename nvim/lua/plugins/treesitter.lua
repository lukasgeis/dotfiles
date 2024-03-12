return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
	ensure_installed = {
	    "lua",
	    "rust",
	    "python",
	    "c",
	    "vim",
	    "bash",
	},
	auto_install = true,
	highlight = {
	    enable = true,
	    use_languagetree = true,
	},
	indent = {
	    enable = true,
	},
    },
    config = function (_, opts)
    	require("nvim-treesitter.configs").setup(opts)
    end
}
