local M = {}

---@param universes multiverse.UniverseSummary[]
---@param limit number
---@return multiverse.UniverseSummary[]
function M.most_recent(universes, limit)
  -- shallow copy: keeps the same universe objects so that later mutations
  -- (e.g. multiverse_manager.load_universe updating lastExplored) write
  -- back to the entries multiverse persists, not a throwaway clone.
  local sorted = {}
  for i, universe in ipairs(universes) do
    sorted[i] = universe
  end
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

---@param recent_universes multiverse.UniverseSummary[]
---@param open fun(universe: multiverse.UniverseSummary)
---@param pick_projects fun()
---@return snacks.dashboard.Item[]
function M.dashboard_keys(recent_universes, open)
  local items = {
    -- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
  }

  for _, item in ipairs(M.project_keys(recent_universes, open)) do
    table.insert(items, item)
  end

  -- table.insert(items, { icon = " ", key = "p", desc = "Projects", action = function() vim.cmd("MultiverseList") end })

  return items
end

return M
