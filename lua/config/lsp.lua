local M = {}

function M.is_server_enabled(config)
  if config == false then
    return false
  end
  return config.enabled ~= false
end

return M
