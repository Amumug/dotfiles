vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("j.plugins")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- neovide config
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h10" -- h10 = size 10
-- https://neovide.dev/configuration.html
vim.g.neovide_floating_corner_radius = 0.7
vim.g.neovide_normal_opacity = 0.93
-- vim.o.guifont = "JetBrains Mono:h15.5"

-- vim.g.neovide_position_animation_length = 0.15

vim.g.neovide_scroll_animation_length = 0.25
vim.g.neovide_scroll_animation_far_lines = 5

vim.g.neovide_cursor_animation_length = 0.15
vim.g.neovide_cursor_trail_size = 0.9
-- typing animation
vim.g.neovide_cursor_short_animation_length = 0.25

vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- vim.g.neovide_cursor_vfx_mode = "sonicboom"
-- vim.g.neovide_cursor_vfx_mode = { "railgun", "pixiedust", "sonicboom" }
vim.g.neovide_cursor_vfx_mode = { "railgun", "pixiedust" }
-- vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.1 -- sonicboom
vim.g.neovide_cursor_vfx_particle_lifetime = 0.7 -- railgun
end

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<CR>') -- Split Vertically
vim.keymap.set('n', '<leader>Q', ':qall!<CR>', { desc = 'Force quit all files' })

-- nvim-tree binds 
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- nvim-ale config
vim.cmd [[
  let g:ale_linters = {
      \ 'typescript': ['tsserver'],
      \ 'typescriptreact': ['tsserver'],
      \ }
  let g:ale_fixers = {
     \ 'javascript': ['prettier'],
     \ 'typescript': ['prettier'],
     \ 'typescriptreact': ['prettier'],
     \ 'json': ['prettier'],
     \ 'markdown': ['prettier'],
     \ 'css': ['prettier'],
     \ 'lua': ['stylua'],
     \ }

  let g:ale_fix_on_save = 1
]]

-- telescope binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


