return {
  {
    'mrcjkb/rustaceanvim',
    version = '^7',
    ft = "rust",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local cfg = require("rustaceanvim.config")

--      local mason_registry = require("mason-registry")
--      local codelldb = mason_registry.get_package("codelldb")

      local codelldb_path = vim.fn.exepath("codelldb")
      local extension_path = vim.fn.fnamemodify(codelldb_path, ":h:h") .. "/packages/codelldb/extension/"

--      local extension_path = codelldb:get_install_path() .. "/extension/"
--      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              inlayHints = {
                typeHints = { enable = true },
                parameterHints = { enable = true },
                chainingHints = { enable = true },
              },
            },
          },
        },
      }
    end,
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },
}
