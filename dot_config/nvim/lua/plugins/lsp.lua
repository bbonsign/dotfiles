return {
  {
    "neovim/nvim-lspconfig",
    -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local format = function()
        require("lazyvim.util").format({ force = true })
      end
      keys[#keys + 1] = { "<leader>lf", format, desc = "Format Document" }
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>lr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end

      keys[#keys + 1] =
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      keys[#keys + 1] = {
        "<leader>lA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      }
      keys[#keys + 1] = {
        "<leader>li",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ nil }))
        end,
        desc = "Toggle Inlay Hints",
        mode = { "n", "v" },
        has = "inlay",
      }
    end,

    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        -- virtual_text = true,
        virtual_text = false,
        float = {
          -- focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
      servers = {
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true, -- Using Ruff
              disableTaggedHints = true,
            },
            python = {
              analysis = {
                -- ignore = { "*" }, -- Using Ruff
                -- typeCheckingMode = "off", -- Using mypy
              },
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
        emmet_ls = {
          filetypes = {
            "html",
            -- "elixir",
            "heex",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "javascript",
            "typescript",
            "markdown",
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L26
                ["bem.enabled"] = true,
              },
            },
          },
        },
        -- tailwindcss = {
        --   -- exclude a filetype from the default_config
        --   -- filetypes_exclude = { "markdown" },
        --   -- add additional filetypes to the default_config
        --   filetypes_include = { "elixir", "heex" },
        --   -- to fully override the default_config, change the below
        --   -- filetypes = {}
        -- },
        rust_analyzer = {
          settings = {
            diagnostics = {
              virtual_text = true,
            },
          },
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.fish,
        },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        fish = { "fish_indent" },
        python = { "ruff_organize_imports", "ruff_format" },
        -- -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
