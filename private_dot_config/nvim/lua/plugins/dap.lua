return {
  {
    "mfussenegger/nvim-dap",
    config = (function()
      -- TODO: Add DAP configs
      local dap = require('dap')
      dap.adapters.lldb = {
        type = 'executable',
        command = 'lldb-vscode',
        name = 'lldb'
      }
      local shared_configs = {
        lldb_config = {
          {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ' + vim.fn.getcwd() .. '/' + 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
          },
        }
      }

      dap.configurations.c = shared_configs.lldb_config
      dap.configurations.cpp = shared_configs.lldb_config
      dap.configurations.rust = shared_configs.lldb_config
    end)
  },
}
