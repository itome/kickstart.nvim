-- Register moonbit filetype
vim.filetype.add {
  extension = {
    mbt = 'moonbit',
  },
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- Register parser before setup() is called
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.moonbit = {
        install_info = {
          url = 'https://github.com/moonbitlang/tree-sitter-moonbit',
          files = { 'src/parser.c', 'src/scanner.c' },
          branch = 'main',
          queries = 'queries',
        },
        filetype = 'moonbit',
      }

      -- Disable treesitter indent for moonbit (upstream indents.scm is incomplete)
      opts.indent = opts.indent or {}
      opts.indent.disable = opts.indent.disable or {}
      table.insert(opts.indent.disable, 'moonbit')

      return opts
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      local configs = require 'lspconfig.configs'

      if not configs.moonbit_lsp then
        configs.moonbit_lsp = {
          default_config = {
            cmd = { vim.fn.expand '~/.moon/bin/moonbit-lsp' },
            filetypes = { 'moonbit' },
            root_dir = lspconfig.util.root_pattern('moon.mod.json', '.git'),
            single_file_support = true,
          },
        }
      end

      lspconfig.moonbit_lsp.setup {}
    end,
  },
}
