local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Add friendly snippets and nvim-cmp configuration
require("lazy").setup({
  { "rafamadriz/friendly-snippets" },  -- Add friendly snippets

  {
    'hrsh7th/nvim-cmp',  -- Add nvim-cmp
    config = function()
      local cmp = require'cmp'

      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)  -- Expand snippets using vsnip
          end,
        },
        mapping = {
          ['<C-k>'] = cmp.mapping.select_prev_item(),  -- Navigate to the previous item
          ['<C-j>'] = cmp.mapping.select_next_item(),  -- Navigate to the next item
          ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
          ['<C-e>'] = cmp.mapping.abort(),  -- Close completion
          ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
        },
        sources = {
          { name = 'vsnip' },  -- Use vsnip snippets
          { name = 'nvim_lsp' },  -- LSP completion
          { name = 'buffer' },  -- Buffer completion
        },
      }
    end,
  }
})

vim.opt.clipboard = 'unnamedplus'

