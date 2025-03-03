vim.diagnostic.config({
  virtual_text = {
    source = "always",
  },
  float = {
    source = "always",
  },
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.ansiblels.setup {
  capabilities = capabilities,
}

lspconfig.autotools_ls.setup {
  capabilities = capabilities,
}

lspconfig.awk_ls.setup {
  capabilities = capabilities,
}

-- https://github.com/bash-lsp/bash-language-server/blob/main/vscode-client/package.json
lspconfig.bashls.setup {
  capabilities = capabilities,
  settings = {
    bashIde = {
      shellcheckPath = "shellcheck",
      shfmt = {
        path = "",
      }
    }
  }
}

lspconfig.clangd.setup {
  capabilities = capabilities,
}

-- https://github.com/clojure-lsp/clojure-lsp/blob/master/docs/all-available-settings.edn
lspconfig.clojure_lsp.setup {
  capabilities = capabilities,
}

lspconfig.cmake.setup {
  capabilities = capabilities,
}

lspconfig.dockerls.setup {
  capabilities = capabilities,
}

-- https://github.com/elixir-lsp/elixir-ls/blob/master/README.md#elixirls-configuration-settings
lspconfig.elixirls.setup {
  capabilities = capabilities,
  cmd = { '/usr/lib/elixir-ls/language_server.sh' },
}

lspconfig.java_language_server.setup {
  capabilities = capabilities,
  cmd = { os.getenv('HOME') .. '/repos/java-language-server/dist/lang_server_linux.sh' },
}

lspconfig.kotlin_language_server.setup {
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
lspconfig.pylsp.setup {
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pylint = {
          enabled = true
        },
        autopep8 = {
          enabled = false
        },
        yapf = {
          enabled = true
        },
      }
    }
  }
}

-- https://rust-analyzer.github.io/book/configuration.html
-- https://rust-analyzer.github.io/book/diagnostics.html
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = "clippy",
      }
    }
  }
}

lspconfig.terraformls.setup {
  capabilities = capabilities,
}

-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
lspconfig.ts_ls.setup {
  capabilities = capabilities,
}

lspconfig.vimls.setup {
  capabilities = capabilities,
}

-- https://github.com/redhat-developer/yaml-language-server/blob/main/README.md#language-server-settings
lspconfig.yamlls.setup {
  capabilities = capabilities,
}
