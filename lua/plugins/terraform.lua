return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      terraformls = {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
              relativePatternSupport = true,
            },
          },
        },
      },
    },
  },
}
