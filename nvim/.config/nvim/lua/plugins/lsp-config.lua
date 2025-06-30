return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      automatic_enable = {
        "lua_ls",
        "bash-language-server",
        "docker-compose-language-service",
        "prettierd"
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")


      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "󱕾 Show quickdocs" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "󱕾 Go to Definition" })
      vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "󱕾 Show signature help" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "󱕾 Code Actions" })
      vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, { desc = "󱕾 LSP Rename" })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "󱕾 Show line diagnostics" })
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
      --
      --Set border for floating windows
      vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
      vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

      vim.diagnostic.config({
        float = { border = "rounded" },
      })
    end,
  },
}
