return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
        {"neovim/nvim-lspconfig"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-buffer"},
        {"L3MON4D3/LuaSnip"},
        {"windwp/nvim-autopairs"},
        {
            "saecki/crates.nvim",
            ft = { "rust", "toml" },
            config = function (_, opts)
                local crates = require("crates")
                crates.setup(opts)
                crates.show()
            end
        },
        {"rhysd/rust-doc.vim"},
        {"tpope/vim-sleuth"},
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require("mason").setup({
            ensure_installed = {
                "rustfmt",
            },
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "lua_ls",
                "pylsp",
                "clangd",
                "marksman",
                "ltex",
                "texlab"
            },
            handlers = {
                lsp_zero.default_setup,
            },
        })

        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                        disable = { "different-requires" },
                        refreshSupport = false,
                    }
                },
            },
        })

        lspconfig.rust_analyzer.setup {
          cmd = { "rustup", "run", "nightly", "rust-analyzer" },
        }


        require("nvim-autopairs").setup({
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        })

        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-j>"] = cmp.mapping.select_prev_item(),
                ["<C-k>"] = cmp.mapping.select_next_item(),
                ["<C-l>"] = cmp.mapping.confirm { select = true },
                ["<C-Space>"] = cmp.mapping.complete {},
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
                { name = "crates" },
                { name = "buffer" },
            }
        })
    end
}
