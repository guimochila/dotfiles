vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "<leader>df", function()
  if string.find(vim.fn.bufname('%'), 'fugitive') then
    vim.api.nvim_buf_delete(vim.api.nvim_get_current_buf(), { force = true })
  else
    vim.cmd("Gvdiff")
  end
end, { desc = "Git diff" })
vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>")
vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>")

local Guimochila_fugitive = vim.api.nvim_create_augroup("Guimochila_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = Guimochila_fugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('push')
    end, opts)

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({ 'pull', '--rebase' })
    end, opts)

    vim.keymap.set("n", "<leader>A", ":Git add .<cr>", opts)

    vim.keymap.set("n", "<leader>t", ":Git push -u origin", opts)
  end
})
