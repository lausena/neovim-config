return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
		'mfussenegger/nvim-dap',
    config = function()
			local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
		end,
  },

  {
    "nvim-neotest/nvim-nio",
    event = "VeryLazy"
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require("dapui").setup()
    end
  },

  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false,
        },
        panel = {
          enabled = false
        },
        filetypes = {
          markdown = true,
          help = true,
          html = true,
          javascript = true,
          python = true,
          ruby = true,
          ["*"] = true
        },
      })

      vim.keymap.set("i", "<S-Tab>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
        end
      end, {silent = true})
    end
  },
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy"
  },
  {
    "greggh/claude-code.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("claude-code").setup({
        command = "claude",
        refresh = {
          enabled = true,
          show_notications = true,
          updatetime = 100,
          timer_interval = 1000,
        },
      })
    end
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        ignore = false,  -- this shows files/folders in .gitignore
      },
      filters = {
        dotfiles = false,
        custom = {},  -- clear default custom filters that hide bin, etc.
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "rust", "toml"
  		},
  	},
  },
}
