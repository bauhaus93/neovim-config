vim.g.mapleader = ' '
pcall(vim.cmd, "colorscheme industry")

local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.expandtab = false

opt.smartcase = true
opt.ignorecase = true
opt.cursorline = true

opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

opt.iskeyword:append("-")


local keymap = vim.keymap

local hop = require('hop')
hop.setup({keys="neiotsradhfplu"})
keymap.set('n', '<leader>n', function() hop.hint_char2() end)
keymap.set('n', '<leader>t', function() hop.hint_lines() end)

local telescope = require('telescope.builtin')
keymap.set('n', '<leader>ff', telescope.find_files, {})
keymap.set('n', '<leader>fg', telescope.live_grep, {})

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

local cmp = require'cmp'
cmp.setup({
	snippet = {
	  expand = function(args)
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  end,
	},
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' },
	}, {
	  { name = 'buffer' },
	})
})
