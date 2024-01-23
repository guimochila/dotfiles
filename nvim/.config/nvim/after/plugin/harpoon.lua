local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local function get_filename(index)
  return mark.get_marked_file_name(index)
end

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Bookmark file - Harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Harpoon" })
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = get_filename(1) })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = get_filename(2) })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = get_filename(3) })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = get_filename(4) })
