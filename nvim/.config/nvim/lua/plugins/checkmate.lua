return {
  "bngarren/checkmate.nvim",
  ft = "markdown",
  opts = {
    files = {
      "*.todo.md",
      "*.todo",
    },
  },
  config = function(_, opts)
    require("checkmate").setup(opts)

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.todo.md", "*.todo" },
      callback = function(ev)
        vim.keymap.set("n", ">>", function()
          vim.cmd("normal! >>")
          vim.schedule(function()
            vim.cmd("normal! $")
          end)
        end, { buffer = ev.buf, noremap = true })
      end,
    })
  end,
}
