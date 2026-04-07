vim.g.mapleader = " "

vim.keymap.set("n", "<leader>b", function()
  if vim.bo.filetype == "oil" then
    require("oil").close()
  else
    require("oil").open()
  end
end)
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>")
