return {
  {
    "ThePrimeagen/99",
    config = function()
      local n99 = require("99")
      n99.setup({
        provider = n99.Providers.ClaudeCodeProvider,
        model = "claude-sonnet-4-6",
      })
      vim.keymap.set("v", "<leader>9v", n99.visual, { desc = "99 visual" })
      vim.keymap.set("n", "<leader>9x", n99.stop_all_requests, { desc = "99 stop" })
      vim.keymap.set("n", "<leader>9s", n99.search, { desc = "99 search" })
    end,
  },
}
