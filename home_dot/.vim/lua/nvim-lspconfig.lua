local lspconfig = require('lspconfig')

lspconfig.ansiblels.setup {}

lspconfig.autotools_ls.setup {}

lspconfig.awk_ls.setup {}

lspconfig.bashls.setup {}

lspconfig.elixirls.setup {
  cmd = { '/usr/lib/elixir-ls/language_server.sh' }
}

lspconfig.clangd.setup {}

-- lspconfig.clojure_lsp.setup {} -- TODO:

lspconfig.cmake.setup {}

lspconfig.java_language_server.setup {
  cmd = { os.getenv('HOME') .. '/repos/java-language-server/dist/lang_server_linux.sh' }
}

lspconfig.kotlin_language_server.setup {}

lspconfig.lua_ls.setup {
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

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pylint = {
          enabled = true
        }
      }
    }
  }
}

lspconfig.rust_analyzer.setup {}

lspconfig.ts_ls.setup {}

lspconfig.vimls.setup {}

lspconfig.yamlls.setup {}
