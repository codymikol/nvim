local WorkspaceManager = require("plugins.workspace-manager.workspace-manager")

-- TODO: On opening a directory that is a workspace, we should hydrate the buffers / windows in the same way as we do when opening a workspaces.

return {
  {
    "natecraddock/workspaces.nvim",
    opts = {
      hooks = {
        open_pre = {
          WorkspaceManager.save,
          WorkspaceManager.clear,
        },
        open = {
          WorkspaceManager.hydrate,
        },
      },
    },
  },
}
