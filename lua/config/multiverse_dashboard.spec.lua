local multiverse_dashboard = require("config.multiverse_dashboard")

describe("multiverse_dashboard.most_recent", function()
  it("returns universes ordered by lastExplored, most recent first", function()
    local universes = {
      { name = "a", lastExplored = 100 },
      { name = "b", lastExplored = 300 },
      { name = "c", lastExplored = 200 },
    }

    local result = multiverse_dashboard.most_recent(universes, 5)

    assert.are.same({ "b", "c", "a" }, vim.tbl_map(function(u)
      return u.name
    end, result))
  end)

  it("limits the result to the requested count", function()
    local universes = {
      { name = "a", lastExplored = 1 },
      { name = "b", lastExplored = 2 },
      { name = "c", lastExplored = 3 },
    }

    local result = multiverse_dashboard.most_recent(universes, 2)

    assert.are.same({ "c", "b" }, vim.tbl_map(function(u)
      return u.name
    end, result))
  end)

  it("does not error when there are fewer universes than the limit", function()
    local universes = { { name = "a", lastExplored = 1 } }

    local result = multiverse_dashboard.most_recent(universes, 5)

    assert.are.same(1, #result)
  end)
end)

describe("multiverse_dashboard.project_keys", function()
  it("assigns shortcut keys 1-5 to each universe, in order", function()
    local universes = {
      { name = "one", lastExplored = 1 },
      { name = "two", lastExplored = 2 },
    }

    local items = multiverse_dashboard.project_keys(universes, function() end)

    assert.are.same({ "1", "2" }, { items[1].key, items[2].key })
    assert.are.same({ "one", "two" }, { items[1].desc, items[2].desc })
  end)

  it("wires each item's action to open that item's universe", function()
    local universes = {
      { name = "one", lastExplored = 1 },
      { name = "two", lastExplored = 2 },
    }
    local opened = {}
    local open = function(universe)
      table.insert(opened, universe.name)
    end

    local items = multiverse_dashboard.project_keys(universes, open)
    items[2].action()

    assert.are.same({ "two" }, opened)
  end)
end)
