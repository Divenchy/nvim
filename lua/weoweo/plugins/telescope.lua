return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
                   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
                     'nvim-tree/nvim-web-devicons',
                   },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, --move to prev result
                        ["<C-j>"] = actions.move_selection_next, --move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --quit
                    }
                }
            }
        })

        telescope.load_extension("fzf");

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
