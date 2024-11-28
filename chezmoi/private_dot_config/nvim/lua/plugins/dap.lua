return {
    {
        "mfussenegger/nvim-dap",
        version = "0.8.0",
        config = function()
            -- TODO: Add DAP configs
            local dap = require("dap")
            dap.adapters.lldb = {
                type = "executable",
                command = "lldb-vscode",
                name = "lldb",
            }
            local shared_configs = {
                lldb_config = {
                    {
                        name = "Launch",
                        type = "lldb",
                        request = "launch",
                        program = function()
                            return vim.fn.input("Path to executable: " + vim.fn.getcwd() .. "/" + "file")
                        end,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = false,
                        args = {},
                    },
                },
            }

            dap.configurations.c = shared_configs.lldb_config
            dap.configurations.cpp = shared_configs.lldb_config
            dap.configurations.rust = shared_configs.lldb_config
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    "nvim-telescope/telescope-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "HUAHUAI23/telescope-dapzzzz",
    "mxsdev/nvim-dap-vscode-js",
}
