local lint = require('lint')

lint.linters_by_ft = {
  lua = {'luacheck'},
  dockerfile = {'hadolint'},
  sh = {'shellcheck'}, -- TODO: options
  terraform = {'tflint'},
  yaml = {'yamllint'},
  vim = {'vint'},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end
})
