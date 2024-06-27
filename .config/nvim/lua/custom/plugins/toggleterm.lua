return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      start_in_insert = true,
      persist_size = true,
      direction = 'float',
      shade_terminals = false,
    }
    vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })
    -- Remap Esc to exit terminal mode
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
    -- Keybinding for opening a horizontal terminal at the bottom
    vim.keymap.set('n', '<leader>ht', function()
      require('toggleterm').toggle(1, nil, nil, 'horizontal')
    end, { noremap = true, silent = true })
    -- Keybinding for opening a vertical terminal at the bottom
    vim.keymap.set('n', '<leader>vt', function()
      require('toggleterm').toggle(1, nil, nil, 'vertical')
    end, { noremap = true, silent = true })
  end,
}
