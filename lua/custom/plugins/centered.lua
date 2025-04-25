return {
  {
    'shortcuts/no-neck-pain.nvim',
    config = function()
      require('no-neck-pain').setup {
        buffers = {
          bo = {
            filetype = 'md',
          },
        },
        autocmds = {
          enableOnVimEnter = true,
          enableOnTabEnter = true,
          reloadOnColorSchemeChange = true,
        },
      }
    end,
  },
}
