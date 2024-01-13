return {
            "mfussenegger/nvim-dap",
            config = function()
                local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "C:/msys64/mingw64/bin/gdb",
                args = {"-i", "dap" }
            }
            dap.configurations.cpp = {
                {
                    name = "GDB",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', '', 'file')
                    end,
                },
            }
            
            dap.configurations.c = dap.configurations.cpp
            -- Keymappings
            vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint)
            vim.keymap.set("n", "<leader>dr", vim.cmd.DapContinue)
            vim.keymap.set("n", "<F1>", ":DapContinue<CR>")
            vim.keymap.set("n", "<F2>", ":DapStepInto<CR>")
            vim.keymap.set("n", "<F3>", ":DapStepOver<CR>")
            vim.keymap.set("n", "<F4>", ":DapStepOut<CR>")
            vim.keymap.set("n", "<F5>", ":DapStepBack<CR>")
            vim.keymap.set("n", "<F6>", ":DapTerminate<CR>")
            vim.keymap.set("n", "<F7>", function()
                        dap.disconnect()
            end)
    end
}
