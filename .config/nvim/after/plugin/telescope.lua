local telescope = require('telescope')

telescope.setup({
    pickers = {
        live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            additional_args = function(_)
                return { "--hidden" }
            end
        },
        find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true
        }

    },
    extensions = {
        "fzf",
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
})

telescope.load_extension("ui-select")
