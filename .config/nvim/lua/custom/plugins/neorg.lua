return {
  'nvim-neorg/neorg',
  dependencies = { { 'luarocks.nvim' }, { 'nvim-lua/plenary.nvim' }, { 'nvim-neorg/neorg-telescope' }, { 'tamton-aquib/neorg-jupyter' } },
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['external.jupyter'] = {},
        ['core.integrations.telescope'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              neorg = '~/neorg',
            },
            default_workspace = 'neorg',
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
