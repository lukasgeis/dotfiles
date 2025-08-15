return {
    "github/copilot.vim",
    config = function()
	vim.g.copilot_enabled = 0

	vim.keymap.set("n", "<leader>cp", function ()
	    vim.cmd("Copilot enable")
	end, { desc = "Enable Copilot" })

	vim.keymap.set("n", "<leader>cP", function ()
	    vim.cmd("Copilot disable")
	end, { desc = "Disable Copilot" })
    end
}
