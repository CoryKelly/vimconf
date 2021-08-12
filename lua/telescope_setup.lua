local action_state = require('telescope.actions.state')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"vendor"},
        prompt_prefix = "🔍 ",
        mappings = {
            i = {
                ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}
require('telescope').load_extension('fzy_native')

local mappings = {}

-- Current buffer finder  
mappings.curr_buf = function()
    local agrs = require('telescope.themes').get_dropdown({sorting_strategy="ascending", previewer=false, winblend=10})
     require('telescope.builtin')
     .current_buffer_fuzzy_find(agrs)
 end
return mappings
