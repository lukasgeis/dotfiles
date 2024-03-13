return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
	"nvim-lua/plenary.nvim"
    },
    config = function()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
	vim.keymap.set("n", "<leader>ss", function()
	    builtin.grep_string({ search = vim.fn.input("Search > ")});
	end)
	vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})
    end
}
