return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ocp_indent = {
          command = "ocp-indent",
          args = { "--config", "base=2" }, -- adjust as needed
          stdin = true,
        },
      },
      formatters_by_ft = {
        ocaml = { "ocp_indent" },
      },
    },
  },
}
