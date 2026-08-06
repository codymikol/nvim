local M = {}

---@param universes multiverse.UniverseSummary[]
---@param limit number
---@return multiverse.UniverseSummary[]
function M.most_recent(universes, limit)
  local sorted = vim.deepcopy(universes)
  table.sort(sorted, function(a, b)
    return a.lastExplored > b.lastExplored
  end)

  local result = {}
  for i = 1, math.min(limit, #sorted) do
    result[i] = sorted[i]
  end
  return result
end

---@param universes multiverse.UniverseSummary[]
---@param open fun(universe: multiverse.UniverseSummary)
---@return snacks.dashboard.Item[]
function M.project_keys(universes, open)
  local items = {}
  for i, universe in ipairs(universes) do
    items[i] = {
      icon = " ",
      key = tostring(i),
      desc = universe.name,
      action = function()
        open(universe)
      end,
    }
  end
  return items
end

return M
