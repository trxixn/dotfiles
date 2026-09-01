return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function ()
		local ts = require("nvim-treesitter")
		ts.setup({})

		-- c, lua, vim, vimdoc are built-in for Neovim 0.12+.
		local parsers = { "rust", "go", "cpp", "javascript", "html", "java" }
		ts.install(parsers)

		-- Neovim 0.12+ handles highlighting natively, but we can ensure it starts
		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end
}
