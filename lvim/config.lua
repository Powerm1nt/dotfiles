-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {"KostkaBrukowa/definition-or-references.nvim"},
 {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
{
  'projekt0n/github-nvim-theme',
  lazy = true, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark_dimmed')
  end,
}
}

lvim.colorscheme = "github_dark_dimmed"
vim.cmd('colorscheme github_dark_dimmed')
vim.cmd('set list')
vim.cmd('set lcs+=space:·')
vim.api.nvim_set_keymap('n', '<Tab>', ':LazyGit<CR>', { noremap = false, silent = true })

