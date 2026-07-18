describe("config.lsp", function()
  local lsp = require("config.lsp")

  describe("is_server_enabled", function()
    it("returns false when config.enabled is false", function()
      assert.is_false(lsp.is_server_enabled({ enabled = false }))
    end)

    it("returns true when config.enabled is not set", function()
      assert.is_true(lsp.is_server_enabled({}))
    end)
  end)
end)
