local M = {}

function M.is_server_enabled(config)
  return config.enabled ~= false
end

return M
