
return function(map)
  -- Go to definition
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  -- Go to declaration
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  -- Go to implementation
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- Go to type definition
  map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- Show hover documentation
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  -- Show signature help
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  -- Show references
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  -- Rename symbol
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Code action
  map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- Show diagnostics
  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
  -- Go to next diagnostic
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  -- Go to previous diagnostic
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
end
--
