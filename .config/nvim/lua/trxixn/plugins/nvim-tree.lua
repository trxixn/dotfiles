return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		require("nvim-tree").setup({
		  renderer = {
		    icons = {
		      show = {
			git = true,
			file = false,
			folder = false,
			folder_arrow = true,
		      },
		      glyphs = {
			folder = {
			  arrow_closed = "⏵",
			  arrow_open = "⏷",
			},
			git = {
			  unstaged = "✗",
			  staged = "✓",
			  unmerged = "⌥",
			  renamed = "➜",
			  untracked = "★",
			  deleted = "⊖",
			  ignored = "◌",
			},
		      },
		    },
		  },
          -- sync pwd with nvim-tree  
          sync_root_with_cwd = true,
          respect_buf_cwd = true,
          update_focused_file = {
            enable = true,
            update_root = true,
            ignore_list = {},
          },
		})

    -- nvim-tree binds 
    vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

	end
}
