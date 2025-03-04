local lint = require('lint')

lint.linters_by_ft = {
  lua = {'luacheck'},
  dockerfile = {'hadolint'},
  sh = {'shellcheck'},
  terraform = {'tflint'},
  yaml = {'yamllint'},
  vim = {'vint'},
}

lint.linters.shellcheck = {
  args = {
    '-s', '-i 2', '-ci', '--format', 'json', '-',
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end
})
