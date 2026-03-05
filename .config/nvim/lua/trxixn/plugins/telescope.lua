return {
  {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		  'BurntSushi/ripgrep',
          'nvim-telescope/telescope-fzf-native.nvim',
           build = 'make',
           "nvim-telescope/telescope-ui-select.nvim",
           "aznhe21/actions-preview.nvim",
	},
	config = function(lazy, opts)
		local telescope = require('telescope')
		telescope.load_extension('fzf')
		telescope.setup({
            defaults = {
                    preview = { treesitter = false },
                    color_devicons = true,
                    sorting_strategy = "ascending",
                    borderchars = {
                        "", -- top
                        "", -- right
                        "", -- bottom
                        "", -- left
                        "", -- top-left
                        "", -- top-right
                        "", -- bottom-right
                        "", -- bottom-left
                    },
                    path_displays = { "smart" },
                    layout_config = {
                        -- anchor = "NW",
                        height = 100,
                        width = 400,
                        prompt_position = "top",
                        preview_cutoff = 30,
                    },

                    horizontal = { 
                        preview_width = 0.5,
                    }
                },
			pickers = {
				-- note: remove the 'builtin.' prefix.
				["lsp_references"] = { wrap_results = true, },
				["lsp_definitions"] = { wrap_results = true, },
				["diagnostics"] = { wrap_results = true, },
				["find_files"] = { wrap_results = true, },
				["buffers"] = { sort_mru = true, ignore_current_buffer = true },
			},
            extensions = {
                    ["ui-select"] = {
                      require("telescope.themes").get_dropdown {}
                    }
                  }
                })
                telescope.load_extension("ui-select")
                require("actions-preview").setup {
                    backend = { "telescope" },
                    extensions = { "env" },
                    telescope = vim.tbl_extend(
                        "force",
                        require("telescope.themes").get_dropdown(), {}
                    )
                }
	end,

	keys = {
		-- See :help telescope.builtin
		{ '<leader>fo', function()
			require("telescope.builtin").oldfiles {
				prompt_title = 'Recent files',
				sort_mru= true
			} end,
			desc = "Old (recent) files"},
			{'<leader><space>', '<cmd>Telescope buffers<cr>', desc = "Buffers"},
			{'<leader>b', '<cmd>Telescope buffers<cr>', desc = "Buffers"},
			{'<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Find filenames"},
			{'<leader>fm', '<cmd>Telescope marks<cr>', desc = "Marks"},
			{'<leader>gf', '<cmd>Telescope git_files<cr>', desc = "Find git files"},
			{'<leader>fw', '<cmd>Telescope live_grep<cr>', desc = "Grep files"},
			{'<leader>fs', '<cmd>Telescope grep_string<cr>', desc = "Grep from files"},
			{"<leader>fb", function()
				require("telescope.builtin").live_grep {
					prompt_title = 'grep open files',
					grep_open_files = true }
				end, desc = "Grep open files"},
				{"<leader>fc", function() require("telescope.builtin").current_buffer_fuzzy_find() end,  desc = "Grep this file"},
				{"<leader>:",  function() require("telescope.builtin").command_history { prompt_title = 'Command history' } end,  desc = "cmd history"},
				{ "<leader>ls", function()
					local aerial_avail, _ = pcall(require, "aerial")
					if aerial_avail then
						require("telescope").extensions.aerial.aerial()
					else
						require("telescope.builtin").lsp_document_symbols()
					end
				end, desc = "Search symbols" },
			}
		}
}

