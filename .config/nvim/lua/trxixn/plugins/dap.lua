return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- The UI windows
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",

    -- Virtual text for variables
    "theHamsta/nvim-dap-virtual-text",

    -- Language specific adapters
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- 1. Setup the UI
    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- 2. Setup Python adapter (using your dedicated venv path)
    require("dap-python").setup(vim.fn.expand("~/.virtualenvs/debugpy/bin/python"))

    table.insert(require('dap').configurations.python, {
      type = 'python',
      request = 'launch',
      name = 'Launch file (integrated terminal)',
      program = '${file}',
      console = 'integratedTerminal',
    })

    -- 3. Auto-open/close the UI when debugging starts/stops
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- 4. Set up some basic keymaps
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "Terminate Debugging" })
  end,
}
