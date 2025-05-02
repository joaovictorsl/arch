return {
	-- LSP
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	-- Completion
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/nvim-cmp'},
	-- Snippets
	{
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
    },
	{'saadparwaiz1/cmp_luasnip'},
}
