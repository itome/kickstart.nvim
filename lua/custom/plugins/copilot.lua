return {
  {
    'zbirenbaum/copilot.lua',
    cond = not vim.g.vscode,
    cmd = 'Copilot',
    event = 'InsertEnter',
    build = ':Copilot auth',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = false,
          debounce = 75,
          keymap = {
            accept = '<Tab>',
            accept_word = false,
            accept_line = false,
          },
        },
      }
    end,
  },
}
