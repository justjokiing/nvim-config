local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "marksman", "texlab", "asm_lsp", }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x', '■'
  }
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
vim.api.nvim_create_autocmd({ "CursorHold"}, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
--   callback = function ()
--     vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
--   end
-- })

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup({
  cmd = { "omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
  use_mono = true,
})

